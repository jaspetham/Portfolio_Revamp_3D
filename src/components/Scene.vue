<script setup>
import { onMounted, ref, watch } from "vue";
import { useRoute } from "vue-router";
import Canvas from "./Canvas";

const route = useRoute();
const currentPath = ref(route.path);
const canvasInstance = ref(null);

watch(
  () => route.path,
    (newPath) => {
        currentPath.value = newPath;
        if (canvasInstance.value) canvasInstance.value.updateBallState(newPath);
    }
);

onMounted(() => {
  canvasInstance.value = new Canvas({
    dom: document.getElementById("container"),
    path: currentPath.value
  });
});
</script>

<template>
  <div id="container"></div>
</template>
