import { ref } from 'vue'
import { defineStore } from 'pinia'

export const usePageStore = defineStore("page", () => {
  const menuState = ref(false);
  const globalScrollPos = ref(0);

  function setMenuState(){
    menuState.value = !menuState.value;
  }

  function updateGlobalScrollPos(scrollTop){
    globalScrollPos.value = scrollTop
  }

  return { menuState, globalScrollPos, setMenuState, updateGlobalScrollPos };
});