import { createRouter, createWebHistory } from "vue-router";
// import HomeView from "../views/HomeViewOld.vue";

const router = createRouter({
    history: createWebHistory(
        import.meta.env.BASE_URL),
    routes: [{
            path: "/",
            name: "home",
            component: () =>
                import ("../views/HomeView.vue"),
            meta: {
                requiresAuth: false,
                title: "Forzathon Shop",
            },
        },
        {
            path: "/taxiFuvarjai",
            name: "taxiFuvarjai",
            component: () =>
                import ("../views/TaxiFuvarjaiView.vue"),
            meta: {
                requiresAuth: false,
                title: "Taxi fuvarjai / Taxi",
            },
        },
        {
            path: "/taxiKezeles",
            name: "taxiKezeles",
            component: () =>
                import ("../views/TaxiKezelesView.vue"),
            meta: {
                requiresAuth: true,
                title: "Taxi Kezelés / Taxi",
            },
        },
        {
            path: "/fuvarBevitel",
            name: "fuvarBevitel",
            component: () =>
                import ("../views/FuvarBevitel.vue"),
            meta: {
                requiresAuth: true,
                title: "Fuvar bevitel / Taxi",
            },
        },
        {
            path: "/login",
            name: "login",
            component: () =>
                import ("../views/LoginView.vue"),
            meta: {
                requiresAuth: false,
                title: "Login / Taxi",
            },
        },
        {
            path: "/:pathMatch(.*)*",
            name: "PageNotFound",
            component: () =>
                import ("../views/404View.vue"),
            meta: {
                requiresAuth: false,
                title: "404 / Taxi",
            },
        },
        // {
        //     path: "/aruhaz",
        //     name: "aruhaz",
        //     component: () =>
        //         import ("../views/AruhazView.vue"),
        //     meta: {
        //         requiresAuth: true,
        //         title: "Taxi Kezelés / Taxi",
        //     },
        // },
    ],
});

export default router;