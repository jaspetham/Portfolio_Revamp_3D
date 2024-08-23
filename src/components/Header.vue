<script setup>
import { usePageStore } from "@/stores/page";
import { storeToRefs } from "pinia";
import DownloadCV from "./DownloadCV.vue";
const store = usePageStore();
const { globalScrollPos } = storeToRefs(store);
const { setMenuState } = store;
</script>
<template>
  <header :class="`header ${globalScrollPos > 250 ? 'scrolled' : ''}`">
    <div class="header-menu flex justify-end items-center">
      <ul class="menu-items">
        <li class="menu-item menu-home"><RouterLink to="/">home</RouterLink></li>
        <li class="menu-item menu-work"><RouterLink to="/work">| work</RouterLink></li>
        <li class="menu-item menu-about"><RouterLink to="about">| about</RouterLink></li>
        <li class="menu-item menu-history">
          <RouterLink to="history">| history</RouterLink>
        </li>
        <li class="menu-item ml-3 menu-download">
          <DownloadCV/>
        </li>
      </ul>
    </div>
    <div @click="setMenuState()" class="menu-button">
      <span></span>
      <span></span>
    </div>
  </header>
</template>

<style lang="css" scoped>
.scrolled{
    backdrop-filter: blur(50px);
}
.header {
  opacity: 1;
  position: fixed;
  width: 100vw;
  top: 0;
  left: 0;
  padding-right: 2rem;
  margin: 0;
  transition: 1s all ease-in-out;
  z-index: 1000;
}

.header-menu {
  margin: 0;
  z-index: 0;
  height:12.5vh;
}

.header-menu .menu-item {
  display: inline-block;
  cursor: pointer;
  color: white;
  text-transform: uppercase;
  letter-spacing: 0.2vw;
  font-size: 0.9vw;
  opacity: 0.5;
  padding-right: 6.5px;
}

.menu-item.menu-download {
  opacity: 1;
}
.menu-download .btn {
  padding: 1rem 1.5rem;
}

.menu-button,
.menu-button span {
  display: inline-block;
  transition: all 0.3s;
  box-sizing: border-box;
}

.menu-button {
  width: 30px;
  height: 60px;
  position: absolute;
  top: 30px;
  right: 30px;
  cursor: pointer;
  z-index: 1000;
  display: none;
}

.menu-button span {
  position: absolute;
  left: 0;
  width: 100%;
  height: 0.2vw;
  min-height: 1px;
  background-color: #fff;
  opacity: 1;
  border-radius: 0vw;
}

.menu-button span:nth-of-type(1) {
  top: 0vw;
}

.menu-button span:nth-of-type(2) {
  top: 2vw;
}

.menu-button.active span:nth-of-type(1) {
  -webkit-transform: translateY(1vw) rotate(-45deg);
  transform: translateY(1vw) rotate(-45deg);
}

.menu-button.active span:nth-of-type(2) {
  -webkit-transform: translateY(-1vw) rotate(45deg);
  transform: translateY(-1vw) rotate(45deg);
}

@media only screen and (max-width: 801px) {
  .header-menu {
    display: none;
  }

  .menu-button {
    display: block;
    opacity: 0.5;
  }
}
</style>
