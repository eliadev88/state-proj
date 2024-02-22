import { createRouter, createWebHistory } from 'vue-router';
import StateView from '../views/StateView.vue';

const routes = [
  {
    path: '/',
    name: 'StateView',
    component: StateView
  },
  // Add other routes for additional views here
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
});

export default router;
