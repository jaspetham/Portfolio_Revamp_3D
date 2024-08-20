<script setup>
import { useRoute } from "vue-router";
import { defineAsyncComponent } from "vue";
import Header from "./components/Header.vue";
import Footer from "./components/Footer.vue";
import Bar from "./components/Bar.vue";
import MobileMenu from "./components/MobileMenu.vue";
import { storeToRefs } from "pinia";
import { usePageStore } from "@/stores/page";
import { computed } from "vue";
const Scene = defineAsyncComponent(() => import("./components/Scene.vue"));
const store = usePageStore();
const { menuState } = storeToRefs(store);
const route = useRoute();
const isHomePage = computed(() => {
    if(route.path === "/"){
        return true;
    }
    return false;
});
</script>

<template>
  <Scene />
  <Transition name="slide-top">
    <Bar :barType="'top'" v-if="isHomePage" />
  </Transition>
  <Transition name="opacity">
    <MobileMenu v-if="menuState" />
  </Transition>
  <Transition name="slide-bottom">
    <Footer v-if="isHomePage" />
  </Transition>
  <Transition name="slide-bottom">
    <Bar :barType="'bottom'" v-if="isHomePage" />
  </Transition>
  <Transition name="slide-top">
    <Header v-if="!isHomePage" />
  </Transition>
  <RouterView v-slot="{ Component }">
    <Transition name="fade" mode="out-in">
        <component :is="Component"/>
    </Transition>
  </RouterView>
</template>

<style scoped>
.slide-top-enter-active,
.slide-top-leave-active {
  transition: top 0.5s ease;
}
.slide-top-leave-active,
.slide-top-enter-active {
  top: -20vh;
}
.slide-top-enter-to {
  top: 0;
}
.slide-bottom-enter-active,
.slide-bottom-leave-active {
  transition: bottom 0.5s ease;
}
.slide-bottom-leave-active,
.slide-bottom-enter-active {
  bottom: -20vh;
}
.slide-bottom-enter-to {
  bottom: 0;
}
.fade-enter-active,
.fade-leave-active {
  transition: transform .5s ease-out;
}
.fade-leave-active,
.fade-enter-active {
  transform: scale(0);
}
.fade-enter-to {
  transform: scale(1);
}
.opacity-enter-active,
.opacity-leave-active {
  transition: opacity 0.5s ease;
}
.opacity-leave-active,
.opacity-enter-active {
  opacity: 0;
}
.opacity-enter-to {
  opacity: 1;
}
</style>
