<template>
  <div>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
      <div class="container-fluid">
        <router-link class="navbar-brand" to="/" @click="onClickMenu(1)"
          >Forzathon</router-link
        >
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <router-link
                class="nav-link active"
                aria-current="page"
                to="/"
                :class="{ active: menuState === 2 }"
                @click="onClickMenu(2)"
                >Home</router-link
              >
            </li>
            <li>
              <router-link class="nav-link active" to="/about"
                >Rólunk / GYIK</router-link
              >
            </li>
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
                :class="{ active: menuState === 4 }"
                @click="onClickMenu(4)"
              >
                Adminisztratív felület
              </a>
              <ul class="dropdown-menu">
                <li>
                  <router-link
                    class="dropdown-item"
                    to="/AruKezeles"
                    :class="{ disabled: !storeLogin.loginSuccess }"
                    >Áruk kezelése</router-link
                  >
                </li>
              </ul>
            </li>

            <li class="nav-item" v-if="!storeLogin.loginSuccess">
              <router-link class="nav-link" to="/login">Login</router-link>
            </li>
            <li
              class="nav-item"
              v-if="storeLogin.loginSuccess"
              @click="logout()"
            >
              <router-link class="nav-link" to="/login"
                >Logout ({{ storeLogin.userName }})</router-link
              >
            </li>
          </ul>


          <form class="d-flex align-items-center" role="search">

            <!-- cart ikon -->
            <p
              class="d-flex text-light m-0 align-items-center"
              v-if="storeLogin.loginSuccess"
              @click="showCart();"
            >
              <span>{{ storeLogin.cartCount }}</span>
              <span class="text-light my-cart-size me-3 ms-3"
                ><i class="bi bi-cart2"></i
              ></span>
            </p>

            <!-- cart ikon -->

            <input
              class="form-control me-2"
              type="search"
              placeholder="Keresés..."
              aria-label="Search"
              v-model="storeKeres.keresoszo"
            />
            <button class="btn btn-outline-warning" type="submit">
              <i class="bi bi-search"></i>
            </button>
          </form>
        </div>




       
      </div>
    </nav>
  </div>
</template>

<script setup>
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
import { useKeresStore } from "@/stores/keres";
const storeKeres = useKeresStore();
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();

const msg = "helo";
let menuState = null;
async function logout() {
  console.log("logout");
  const urlLogout = storeUrl.urlLogout;
  const body = {
    token: storeLogin.refreshToken,
  };
  const config = {
    method: "DELETE",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
    body: JSON.stringify(body),
  };
  const response = await fetch(urlLogout, config);
  storeLogin.clearLogin();
}

function showCart(){
  alert("geci")
}

function onClickMenu(number) {
  this.menuState = number;
}
// export default {
//   data() {
//     return {
//       storeUrl,
//       storeLogin
//     }
//   }
// };
</script>

<style>
.my-cart-size {
  font-size: 1.5rem;
}

.my-cart-size:hover{
  cursor: pointer;
}
/* .router-link-active {
  color: white !important
}

.navbar-nav > li > .dropdown-menu a:link,
.navbar-nav > li > .dropdown-menu a:hover { background-color: black} */
</style>
