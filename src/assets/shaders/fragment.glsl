uniform float time;
uniform float progress;
uniform float timeMultiply;
uniform float cameraZPos;

uniform sampler2D texture1;
uniform vec4 resolution;
uniform vec2 mouse;
uniform float shape;

varying vec2 vUv;
varying vec3 vPosition;
float PI=3.141592653589793238;

mat4 rotationMatrix(vec3 axis,float angle){
  axis=normalize(axis);
  float s=sin(angle);
  float c=cos(angle);
  float oc=1.-c;

  return mat4(oc*axis.x*axis.x+c,oc*axis.x*axis.y-axis.z*s,oc*axis.z*axis.x+axis.y*s,0.,
    oc*axis.x*axis.y+axis.z*s,oc*axis.y*axis.y+c,oc*axis.y*axis.z-axis.x*s,0.,
    oc*axis.z*axis.x-axis.y*s,oc*axis.y*axis.z+axis.x*s,oc*axis.z*axis.z+c,0.,
  0.,0.,0.,1.);
}

vec3 rotate(vec3 v,vec3 axis,float angle){
  mat4 m=rotationMatrix(axis,angle);
  return(m*vec4(v,1.)).xyz;
}
float sphere(vec3 p){
  return length(p) - 0.5;
}
float sdCutHollowSphere(vec3 p,float r,float h,float t)
{
  // sampling independent computations (only depend on shape)
  float w=sqrt(r*r-h*h);

  // sampling dependant computations
  vec2 q=vec2(length(p.xz),p.y);
  return((h*q.x<w*q.y)?length(q-vec2(w,h)):
  abs(length(q)-r))-t;
}

float sdSolidAngle(vec3 p,vec2 c,float ra)
{
  vec2 q=vec2(length(p.xz),p.y);
  float l=length(q)-ra;
  float m=length(q-c*clamp(dot(q,c),0.,ra));
  return max(l,m*sign(c.y*q.x-c.x*q.y));
}

float SineCrazy(vec3 p){
  return 1. - (sin(p.x) + sin(p.y) + sin(p.z)) / 3.;
}

float scene(vec3 p){
  vec3 p1 = rotate(p, vec3(1.,1.,1.), time * 0.25);
  float scale = 20. + 15. * (sin(time / 2.) * timeMultiply);
  return max(
    mix(sphere(p1),sdCutHollowSphere(p1,.71,.71,.71),shape),
    (1.-SineCrazy(p1*scale))/scale
  );
}

vec3 getNormal(vec3 p){
  vec2 o = vec2(0.001, 0.);
  return normalize(
    vec3(
      scene(p + o.xyy) - scene(p - o.xyy),
      scene(p + o.yxy) - scene(p - o.yxy),
      scene(p + o.yyx) - scene(p - o.yyx)
    )
  );
}

vec3 GetColor(float amount){
  vec3 col = 0.5 + 0.5 * cos(6.28319 * (vec3(0.2, 0., 0.) + amount * vec3(1.,1.,.5)));
  return col * amount;
}
vec3 GetColorAmount(vec3 p){
  float amount = clamp( (1.5 - length(p))/1.,0., 1.);
  vec3 col = 0.5 + 0.5 * cos(6.28319 * (vec3(0.5451, 0.651, 0.7922) + amount * vec3(0.0745, 0.2118, 0.5059)));
  // vec3 col=.5+.5*cos(6.28319*(vec3(0.0431, 0.4667, 0.9529)+amount*vec3(0.7608, 0.3843, 0.1333)));

  return col * amount;
}

void main(){
  vec2 newUV = (vUv - vec2(0.5))*resolution.zw + vec2(0.5);

  vec2 p = newUV - vec2(.5);

  p.x -= mouse.x * 0.025;
  p.y -= mouse.y * 0.025;


  vec3 camPos = vec3(0.,0.,cameraZPos + (1. * sin(time* 0.5)* 0.25));

  vec3 ray = normalize(vec3(p, -1.));

  vec3 rayPos = camPos;

  float curDist = 0.;
  float rayLen = 0.;
  vec3 light = vec3(-1.,1.,1.);

  vec3 color = vec3(0.0235, 0.0235, 0.0275);

  for(int i=0; i<=64; i++){
    curDist = scene(rayPos);
    rayLen += 0.6 * curDist;
    rayPos = camPos + ray * rayLen;

    if(abs(curDist) < 0.001){
      vec3 n = getNormal(rayPos);

      float diff = dot(n,light);

      // color = GetColor(diff);
      // color = GetColor(2. * length(rayPos));
      break;
    }

    color += 0.01 * GetColorAmount(rayPos);
  }

  gl_FragColor=vec4(color,1.);
  gl_FragColor.r -= abs(mouse.x * 0.2) * 0.25;
  gl_FragColor.g -= abs(mouse.y * 0.2) * 0.25;
}
