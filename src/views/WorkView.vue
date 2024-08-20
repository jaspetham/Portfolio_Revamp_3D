<script setup>
import { ref } from "vue";
import SectionTitle from "@/components/SectionTitle.vue";
import works from "@/assets/json/works.json";
import Container from "@/components/Container.vue";
const projects = ref(works);
</script>

<template>
  <Container>
    <SectionTitle :title="'Work'" :subTitles="['Personal', 'Projects']" />
    <div class="list">
      <a
        class="work-item"
        target="_blank"
        data-aos-easing="ease-in-out"
        data-aos="fade-up"
        data-aos-offset="0"
        data-aos-duration="1000"
        data-aos-delay="0"
        v-for="project in projects"
        :key="project.id"
        :href="project.url"
      >
        <div v-for="index in 8" :key="index" class="hover-point"></div>
        <div class="box-contents">
          <img class="box-img" :src="project.imgSrc" alt="" />
          <div class="box-details">
            <div class="box-subtitle">{{ project.type }}</div>
            <div class="box-title">{{ project.name }}</div>
          </div>
        </div>
      </a>
    </div>
  </Container>
</template>


<style lang="css" scoped>
.list {
    display: grid;
    grid-template-columns: 1fr 1fr;
    margin-top:45vh;
    width: 95vw;
    top:0;
    position: relative;
}
.list.list-content{
  grid-template-columns: 1fr;
  font-family: var(--ff-secondary);
  color: var(--clr-main);
}
.work-item {
  -webkit-transform: translateZ(0);
  float: left;
  margin: 2.5vw;
  position: relative;
  width: 42.5vw;
  cursor: pointer;
  height: 22vw;
}

.work-item img {
  width: 42.5vw;
  object-fit: cover;
  height: 22vw;
  transition: .5s opacity;
  opacity: .7;
  -webkit-transform: translateZ(0);
}
.work-item img{
  opacity: .7;
}
.box-contents {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  box-shadow: 0 0 50px rgba(var(--box-shadow));
  transition: 0.5s ease;
}
.box-contents > .box-img {
  object-fit: cover;
  width: 100%;
  height: 100%;
}
.box-contents .box-details {
  position: absolute;
  left: 0;
  bottom: -1px;
  background: rgba(0, 0, 0, 0.8);
  width: 100%;
  padding: 1rem;
  opacity: 0;
  visibility: hidden;
  transition: all 0.5s ease-in;
  text-transform: uppercase;
  padding: 2vw;
  padding-top: 1vw;
}
.box-details > * {
  color: white;
  z-index: 10;
}
.box-details .box-subtitle {
  color: grey;
  text-transform: uppercase;
  margin-bottom: 0.5vw;
  transition: 0.1s all;
  font-size: 1vw;
  font-family: var(--ff-secondary);
}
.box-details .box-title {
  color: white;
  text-transform: uppercase;
  letter-spacing: 1px;
  transition: 0.1s all;
  font-size: 1.4vw;
  font-family: var(--ff-secondary);
}
.work-item:hover .box-details {
  opacity: 1;
  visibility: visible;
}
.hover-point {
  position: absolute;
  z-index: 2;
  width: calc(100% / 3);
  height: calc(100% / 3);
}
.hover-point:nth-child(1) {
  top: 0;
  left: 0;
}
.hover-point:nth-child(2) {
  top: 0;
  left: calc(100% / 3);
}
.hover-point:nth-child(3) {
  top: 0;
  right: 0;
}
.hover-point:nth-child(4) {
  top: calc(100% / 3);
  left: 0;
}
.hover-point:nth-child(5) {
  top: calc(100% / 3);
  right: 0;
}
.hover-point:nth-child(6) {
  bottom: 0;
  left: 0;
}
.hover-point:nth-child(7) {
  bottom: 0;
  left: calc(100% / 3);
}
.hover-point:nth-child(8) {
  bottom: 0;
  right: 0;
}
.hover-point:nth-child(1):hover ~ .box-contents {
  box-shadow: 15px 15px 50px rgba(var(--box-shadow));
  transform-origin: right top;
  transform: perspective(5000px) rotateX(10deg) rotateY(-10deg) rotateZ(2deg);
}
.hover-point:nth-child(2):hover ~ .box-contents {
  box-shadow: 0 15px 50px rgba(var(--box-shadow));
  transform-origin: center top;
  transform: perspective(5000px) rotateX(10deg);
}
.hover-point:nth-child(3):hover ~ .box-contents {
  box-shadow: -15px 15px 50px rgba(var(--box-shadow));
  transform-origin: left top;
  transform: perspective(5000px) rotateX(10deg) rotateY(10deg) rotateZ(-2deg);
}
.hover-point:nth-child(4):hover ~ .box-contents {
  box-shadow: 15px 5px 50px rgba(var(--box-shadow));
  transform-origin: left center;
  transform: perspective(5000px) rotateY(-10deg);
}
.hover-point:nth-child(5):hover ~ .box-contents {
  box-shadow: -15px 5px 50px rgba(var(--box-shadow));
  transform-origin: right center;
  transform: perspective(5000px) rotateY(10deg);
}
.hover-point:nth-child(6):hover ~ .box-contents {
  box-shadow: 15px -15px 50px rgba(var(--box-shadow));
  transform-origin: right bottom;
  transform: perspective(5000px) rotateX(-10deg) rotateY(-10deg) rotateZ(-2deg);
}
.hover-point:nth-child(7):hover ~ .box-contents {
  box-shadow: 0 -15px 50px rgba(var(--box-shadow));
  transform-origin: center bottom;
  transform: perspective(5000px) rotateX(-10deg);
}
.hover-point:nth-child(8):hover ~ .box-contents {
  box-shadow: -15px -15px 50px rgba(var(--box-shadow));
  transform-origin: left bottom;
  transform: perspective(5000px) rotateX(-10deg) rotateY(10deg) rotateZ(2deg);
}
@media only screen and (max-width: 801px) {
  .list{
    grid-template-columns: 1fr;
    margin-top: 25vh;
  }
  .work-item {
    width: 85vw;
    height: 44vw;
  }
}

</style>

