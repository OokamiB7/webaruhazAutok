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
            <!-- start cart ikon -->
            <p
              class="d-flex text-light m-0 align-items-center"
              v-if="storeLogin.loginSuccess"
              @click="showCart()"
            >
              <span>{{ storeLogin.cartCount }}</span>


              <span class="text-light my-cart-size me-3 ms-3"
                ><i class="bi bi-cart2"></i
              ></span>
            </p>

            <!-- end cart ikon -->

            <input
              class="form-control me-2"
              type="search"
              placeholder="Keresés..."
              aria-label="Search"
              v-model="storeKeres.keresoszo"
            />
            
          </form>
        </div>
      </div>
    </nav>

    <!-- modal -->

    <div
      class="modal fade"
      id="modalCart"
      tabindex="-1"
      aria-labelledby="mocalCartLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h1>Rendelés</h1>
          </div>

          <div class="modal-body">
            <table class="table table-striped table-dark table-bordered w-auto">
              <thead>
                <tr>
                  <th>Műveletek</th>
                  <th>Név</th>
                  <th>Mennyiség</th>
                  <th>Egységár</th>
                  <th>Ár</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(product, index) in products"
                  :key="`product${index}`"
                >
                  <td class="text-nowrap">
                    <!-- törlés -->
                    <button
                      type="button"
                      class="btn btn-outline-danger btn-sm"
                      @click="onClickDelete(product.id)"
                    >
                      <i class="bi bi-trash3-fill"></i>
                    </button>
                  </td>
                  <td>{{ product.productName }}</td>
                  <td>{{ product.quantity }}</td>
                  <td>{{ product.unitPrice }}</td>
                  <td>{{ product.price }}</td>
                </tr>
              </tbody>
            </table>
          </div>

          <div class="modal-footer">
            <div class="d-flex align-items-center">
              <div class="form-group d-flex align-items-center"></div>


               <router-link to="rendeles">
                 <button
                   type="button"
                   class="btn btn-success buyButton ms-3"
                   data-bs-dismiss="modal"
                   
                 >
                   Rendelés
                 </button>

               </router-link>

              <button
                type="button"
                class="btn btn-secondary ms-3"
                data-bs-dismiss="modal"
                
              >
                Close
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import * as bootstrap from "bootstrap";
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
import { useKeresStore } from "@/stores/keres";
import { ref } from "vue";
const storeKeres = useKeresStore();
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();
let modal = null;
let products = ref([]);

addEventListener("load", (event) => {
  modal = new bootstrap.Modal(document.getElementById("modalCart"), {
    keyboard: false,
  });
  // products = [
  // {
  //     id: 26,
  //     productName: "Akkumulátor",
  //     quantity: 1,
  //     unitPrice: 23760,
  //     price: 23760
  //   }
  // ]
});

class Cart {
  constructor() {
    this.userId = null;
    this.productId = null;
    this.shoppingDate = null;
    this.bought = null;
    this.quantity = null;
    this.price = null;
    this.shoppingId = null;
  }
}

let cartKartya = new Cart();
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


async function getCartProducts() {
  const url = `${storeUrl.urlCartByShoppingId}/${storeLogin.shoppingId}`;
  const response = await fetch(url);
  const data = await response.json();

  products.value = data.data;
  console.log(products.value);
}

function onClickDelete(id){
  if (confirm("Valóban törölni akarod?" ) == true) {
        deleteProductInCart(id); 
      }
}

async function deleteProductInCart(id){
  let url = `${storeUrl.urlCart}/${id}`;
      const config = {
        method: "DELETE",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      getCartProducts();
      storeLogin.cartCount = storeLogin.cartCount - 1;
}

function showCart() {
  if (storeLogin.cartCount != 0) {
    getCartProducts();
    // const url = `${storeUrl.urlCartByShoppingId}/${storeLogin.shoppingId}`;
    // const response = await fetch(url);
    // const data = await response.json();

    // products = data.data;
    // console.log(products);
    modal.show();
  }
}

function onClickMenu(number) {
  menuState = number;
}
</script>

<style>
.my-cart-size {
  font-size: 1.5rem;
}

.my-cart-size:hover {
  cursor: pointer;
}
</style>
