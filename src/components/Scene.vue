<script setup>
import * as THREE from "three";
import vertex from "@/assets/shaders/vertex.glsl";
import fragment from "@/assets/shaders/fragment.glsl";
import gsap from "gsap";
import { onMounted, ref, watch } from "vue";
import { useRoute } from "vue-router";

const route = useRoute();
const currentPath = ref(route.path);
const sketchInstance = ref(null);

watch(
  () => route.path,
  (newPath) => {
    currentPath.value = newPath;
    if (sketchInstance.value) sketchInstance.value.updateBallState(newPath);
  }
);

onMounted(() => {
  class Sketch {
    constructor(options) {
      this.scene = new THREE.Scene();
      this.container = options.dom;
      this.width = this.container.offsetWidth;
      this.height = this.container.offsetHeight;
      this.renderer = new THREE.WebGLRenderer();
      this.renderer.setPixelRatio(window.devicePixelRatio);
      this.renderer.setSize(this.width, this.height);
      this.renderer.setClearColor(0xeeeeee, 1);
      this.renderer.physicallyCorrectLights = true;
      this.renderer.outputEncoding = THREE.sRGBEncoding;

      this.container.appendChild(this.renderer.domElement);
      this.isOpen = true;
      this.camera = new THREE.PerspectiveCamera(
        70,
        window.innerWidth / window.innerHeight,
        0.001,
        1000
      );
      this.camera.position.set(0, 0, 2);
      this.time = new THREE.Clock();
      this.elapsedTime = 0;
      this.previousTime = 0;

      this.isPlaying = true;

      this.addObjects();
      this.resize();
      this.render();
      this.setupResize();
      this.mouseEvents();
      this.updateBallState(route.path);
    }
    mouseEvents() {
      this.mouse = new THREE.Vector2();
      let that = this;
      function onMouseMove(event) {
        that.mouse.x = (event.clientX / window.innerWidth) * 2 - 1;
        that.mouse.y = -(event.clientY / window.innerHeight) * 2 + 1;

        that.material.uniforms.mouse.value = that.mouse;
      }
      window.addEventListener("pointermove", onMouseMove, false);
    }
    updateBallState(path) {
      const animationParams = path === "/" ? { a: 0, b: 0.25 } : { a: 1, b: 2 };
      this.animationValue(animationParams.a, animationParams.b);
    }

    animationValue(a, b) {
      gsap.to(this.material.uniforms.shape, {
        value: a,
        duration: 1.5,
        ease: "power3.out",
      });
      gsap.to(this.material.uniforms.timeMultiply, {
        value: b,
        duration: 3,
        ease: "power3.in",
      });
    }

    setupResize() {
      window.addEventListener("resize", this.resize.bind(this));
    }

    resize() {
      this.width = this.container.offsetWidth;
      this.height = this.container.offsetHeight;
      this.renderer.setSize(this.width, this.height);
      this.camera.aspect = this.width / this.height;

      // image cover
      this.imageAspect = 1;
      let a1;
      let a2;
      if (this.height / this.width > this.imageAspect) {
        a1 = (this.width / this.height) * this.imageAspect;
        a2 = 1;
      } else {
        a1 = 1;
        a2 = this.height / this.width / this.imageAspect;
      }

      if (this.width > 801) {
        this.material.uniforms.cameraZPos.value = 3;
      } else {
        this.material.uniforms.cameraZPos.value = 5;
      }

      this.material.uniforms.resolution.value.x = this.width;
      this.material.uniforms.resolution.value.y = this.height;
      this.material.uniforms.resolution.value.z = a1;
      this.material.uniforms.resolution.value.w = a2;

      const dist = this.camera.position.z;
      const height = 1;
      this.camera.fov = 2 * (180 / Math.PI) * Math.atan(height / (2 * dist));

      if (this.width / this.height > 1) {
        this.plane.scale.x = this.camera.aspect;
      } else {
        this.plane.scale.y = 1 / this.camera.aspect;
      }

      this.camera.updateProjectionMatrix();
    }

    addObjects() {
      this.material = new THREE.ShaderMaterial({
        extensions: {
          derivatives: "#extension GL_OES_standard_derivatives : enable",
        },
        side: THREE.DoubleSide,
        uniforms: {
          time: { value: 0 },
          mouse: { value: new THREE.Vector2(0, 0) },
          shape: { value: 0 },
          timeMultiply: { value: 0.25 },
          cameraZPos: { value: 3 },
          resolution: { value: new THREE.Vector4() },
          uvRate1: {
            value: new THREE.Vector2(1, 1),
          },
        },
        vertexShader: vertex,
        fragmentShader: fragment,
      });

      this.geometry = new THREE.PlaneGeometry(1, 1, 1, 1);

      this.plane = new THREE.Mesh(this.geometry, this.material);
      this.scene.add(this.plane);
    }

    stop() {
      this.isPlaying = false;
    }

    play() {
      if (!this.isPlaying) {
        this.render();
        this.isPlaying = true;
      }
    }

    render() {
      if (!this.isPlaying) return;
      this.elapsedTime = this.time.getElapsedTime();
      this.material.uniforms.time.value = this.elapsedTime;
      requestAnimationFrame(this.render.bind(this));
      this.renderer.render(this.scene, this.camera);
    }
  }
  sketchInstance.value = new Sketch({
    dom: document.getElementById("container"),
  });
});
</script>

<template>
  <div id="container"></div>
</template>
