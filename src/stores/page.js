import { ref } from 'vue'
import { defineStore } from 'pinia'

export const usePageStore = defineStore("page", () => {
  const isMenuOpen = ref(false);
  const globalScrollPos = ref(0);

  function setMenuState(){
    isMenuOpen.value = !isMenuOpen.value;
  }

  function updateGlobalScrollPos(scrollTop){
    globalScrollPos.value = scrollTop
  }

  return { isMenuOpen, globalScrollPos, setMenuState, updateGlobalScrollPos };
});