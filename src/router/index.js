import { createRouter, createWebHistory } from "vue-router";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "home",
      component: () => import("../views/HomeView.vue")
    },
    {
      path: "/work",
      name: "work",
      component: () => import("../views/WorkView.vue")
    },
    {
      path: "/about",
      name: "about",
      component: () => import("../views/AboutView.vue")
    },
    {
      path: "/history",
      name: "history",
      component: () => import("../views/HistoryView.vue")
    },
    // Catch-all route for 404 errors
    {
      path: "/:pathMatch(.*)*",
      redirect: "/"
    }
  ]
});

export default router;
