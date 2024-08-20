<script setup>
import { RouterLink } from 'vue-router';
import DownloadCV from './DownloadCV.vue';
</script>

<template>
  <div class="footer-menu">
    <ul class="menu-items">
      <li class="menu-item menu-work"><RouterLink to="work">work</RouterLink></li>
      <li class="menu-item menu-about"><RouterLink to="about">about</RouterLink></li>
      <li class="menu-item menu-history"><RouterLink to="history">history</RouterLink></li>
      <li class="menu-item menu-download">
        <DownloadCV/>
      </li>
    </ul>
  </div>
</template>

<style lang="css" scoped>
.footer-menu {
  z-index: 100;
  padding: 0;
  margin: 0;
  position: fixed;
  bottom: 15vh;
  width: 100%;
  text-align: center;
  opacity: 1;
  transition: 0.4s all ease-in-out;
}
.footer-menu .menu-items {
  padding: 0;
  margin: 0;
}
.footer-menu .menu-item {
  display: inline-block;
  cursor: pointer;
  color: white;
  text-transform: uppercase;
  letter-spacing: 0.2vw;
  text-indent: 0.2vw;
  font-size: 1vw;
  opacity: 0.5;
  padding-right: 4vw;
  padding-left: 4vw;
  user-select: none;
}
.menu-item.menu-download {
  opacity: 1;
}
@media only screen and (max-width: 801px) {
  .footer-menu {
    bottom: 5vh;
  }
  .footer-menu .menu-item {
    font-size: 3vw;
    padding-left: 3vw;
    padding-right: 3vw;
  }
  .footer-menu .menu-item:last-child {
    padding: 0;
  }
  .footer-menu .menu-item .btn {
    padding: 0.75rem 1rem;
  }
}
</style>
