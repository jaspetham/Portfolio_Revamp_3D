<script setup>
import Container from '@/components/Container.vue';
import SectionTitle from '@/components/SectionTitle.vue';
</script>
<template>
  <Container>
    <SectionTitle :title="'about'" :subTitles="['Myself','Get to know me']"/>
    <div class="list list-content">
      <div class="divider"></div>
      <div class="info">
        <div class="bio">
          <p>
            Hello, I'm Jasper Tham, a senior front end developer.
            Ambitious Front End Developer with over 4 years of experience, with a strong drive for self-improvement
and a clear goal of transitioning into a Full Stack role. Dedicated to continuous learning, with a focus on
mastering Three.js for 3D web development. Passionate about achieving excellence and eager to contribute
to innovative projects as a versatile Full Stack Developer.
          </p>
          <p class="mt-3 md:mt-6">Below is my current skillset.</p>
          <div class="grid grid-cols-2 gap-3 mt-5 md:mt-10">
            <div>
              <p>Frontend Skills</p>
              <ul class="mt-5 list-disc list-inside">
                <li class="skills-item">VueJS</li>
                <li class="skills-item">Bootstrap</li>
                <li class="skills-item">Tailwind CSS</li>
                <li class="skills-item">ReactJS</li>
                <li class="skills-item">Javascript</li>
              </ul>
            </div>
            <div>
              <p>Others Skills</p>
              <ul class="mt-5 list-disc list-inside">
                <li class="skills-item">ThreeJS (3D)</li>
                <li class="skills-item">Git</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </Container>
</template>
<style lang="css" scoped>
  .info .bio{
    margin-inline: auto;
    width: 90vw;
    font-size: 1.4vw;
    padding-bottom:10vw;
  }
  .info .bio p{
    opacity:.9;
  }
  .skills-item{
    font-size:1vw;
    font-weight:400;
    margin-bottom:1rem;
  }

  @media only screen and (max-width: 801px){
    .info .bio {
      font-size: 2.5vh;
    }
    .skills-item{
      font-size:2vh;
    }
  }
</style>

