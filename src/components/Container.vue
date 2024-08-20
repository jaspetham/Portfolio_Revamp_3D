<script setup>
import { onMounted, onUnmounted, ref } from "vue";
import { usePageStore } from "@/stores/page";
import { storeToRefs } from "pinia";
const store = usePageStore();
const { globalScrollPos } = storeToRefs(store);
const { updateGlobalScrollPos } = store;
const scrollableElement = ref(null);
const scrollThreshold = 200; // Set the threshold value in pixels

const handleScroll = () => {
  if (scrollableElement.value) {
    const scrollTop = scrollableElement.value.scrollTop;
    if (scrollTop > scrollThreshold) {
      updateGlobalScrollPos(scrollTop);
    }
  }
};

onMounted(() => {
  if (scrollableElement.value) {
    scrollableElement.value.addEventListener("scroll", handleScroll);
  }
});

onUnmounted(() => {
    globalScrollPos.value = 0;
  if (scrollableElement.value) {
    scrollableElement.value.removeEventListener("scroll", handleScroll);
  }
});
</script>

<template>
  <div ref="scrollableElement" class="relative scroll-container z-10">
    <slot></slot>
  </div>
</template>
