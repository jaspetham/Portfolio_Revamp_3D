<script setup>
import { RouterLink } from "vue-router";
import { storeToRefs } from "pinia";
import { usePageStore } from "@/stores/page";
const store = usePageStore();
const { menuState } = storeToRefs(store);
</script>
<template>
  <div :class="`menu ${menuState ? 'show' : ''}`">
    <ul class="menu-items">
      <li class="menu-item menu-home" data-link="home">
        <RouterLink to="/">home</RouterLink>
      </li>
      <li class="menu-item menu-work" data-link="work">
        <RouterLink to="/work">work</RouterLink>
      </li>
      <li class="menu-item menu-about" data-link="about">
        <RouterLink to="/about">about</RouterLink>
      </li>
      <li class="menu-item menu-history" data-link="history">
        <RouterLink to="/history">history</RouterLink>
      </li>
      <li class="menu-item menu-download">
        <a class="btn" href="/2024_CV.pdf" download> Download CV </a>
      </li>
    </ul>
  </div>
</template>

<style lang="css" scoped>
.menu {
  opacity: 1;
  width: 100vw;
  height: 100%;
  left: 50%;
  top: 50%;
  position: fixed;
  transform: translate(-50%, -50%);
  padding: 0;
  margin: 0;
  transition: 1s all;
  z-index: 1000;
  background: #000;
}

.menu .menu-items {
  left: 50%;
  top: 50%;
  position: absolute;
  transform: translate(-50%, -50%);
  padding: 0;
  margin: 0;
  margin-top: 0vw;
}

.menu .menu-item {
  cursor: pointer;
  list-style: none;
  opacity: 1;
  text-align: center;
  font-size: 9vw;
  line-height: 10vh;
  text-transform: uppercase;
  color: white;
}

.menu-item.menu-download {
  font-size: 1rem;
}
</style>
