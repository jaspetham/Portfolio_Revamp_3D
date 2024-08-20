import './assets/main.css'
import './assets/tailwind.css'

import { createApp, computed } from 'vue'
import { createPinia, storeToRefs } from "pinia";

import App from './App.vue'
import router from './router'
import { usePageStore } from './stores/page'

const app = createApp(App)

app.use(createPinia())
app.use(router)

router.beforeEach((to, from, next) => {
    const store = usePageStore();
    const { menuState } = storeToRefs(store);
    menuState.value = false;
    next();
});

app.mount('#app')
