<script setup>
import { defineProps } from "vue";
const props = defineProps({
  barType: {
    default: "top",
    type: String,
  },
});
</script>

<template>
  <div :class="`${barType === 'top' ? 'top-bar' : 'bottom-bar'}` + ' bar'"></div>
</template>

<style scoped>
.bar {
  width: 100%;
  height: 10vh;
  background: black;
  position: fixed;
  z-index: 1000;
  text-align: center;
  transition: 0.3s ease-in-out;
}
.bar.hide {
  height: 0vh;
  min-height: 0;
}
.top-bar {
  top: 0;
}
.bottom-bar {
  bottom: 0;
}
@media only screen and (max-width: 801px) {
  .bar {
    height: 0;
    min-height: 0;
  }
}
</style>
