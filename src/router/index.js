import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import WorkView from '../views/WorkView.vue'
import AboutView from '../views/AboutView.vue'
import HistoryView from "../views/HistoryView.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: HomeView
    },
    {
      path: "/work",
      name: "work",
      component: WorkView
    },
    {
      path: "/about",
      name: "about",
      component: AboutView
    },
    {
      path: "/history",
      name: "history",
      component: HistoryView
    },
    // Catch-all route for 404 errors
    {
      path: "/:pathMatch(.*)*",
      redirect: "/"
    }
  ]
});

export default router
