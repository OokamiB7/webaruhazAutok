<template>
  <div class="p-3">
    <h1 class="Cim">Kínálataink</h1>

    <div class="col-md-12 my-border">
      <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
        <!-- kártya temlate -->
        <div class="col" v-for="(product, index) in products" :key="index">
          <div class="card my-bg-card">
            <img
              class="card-img-top product-image"
              :src="'../../imgs/' + product.productName + '.jpg'"
              alt="Áru képe"
            />
            <div class="card-body">
              <h5 class="card-title" v-html="product.productName"></h5>
              <p>Ár: {{ product.price }}Ft</p>
              <p>Darab: {{ product.quantity }}</p>
              <p>Raktáron: {{ product.isInStock }}DB</p>

              <button
                type="button"
                class="btn btn-dark"
                data-bs-toggle="modal"
                data-bs-target="#exampleModal"
                @click="onClickReszletek(product.id)"
              >
                Megtekintés
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- modal -->
    <div
      class="modal fade"
      id="modalProduct"
      tabindex="-1"
      aria-labelledby="modalProductLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h1
              class="modal-title fs-5"
              id="modalProduct"
              v-html="productKartya.productName"
            ></h1>
          </div>
          <div class="modal-body">
            <p>Ár: {{ productKartya.price }}Ft</p>
            <p>Darab: {{ productKartya.quantity }}DB</p>
            <p>Raktáron: {{ productKartya.isInStock }}DB</p>
            <p>Leírás: {{ productKartya.description }}</p>
          </div>


          <div class="modal-footer">
            <div class="d-flex align-items-center">
              <div class="form-group d-flex align-items-center" v-if="storeLogin.loginSuccess">

                <label for="buyCounter" class="m-0 p-0">Darab</label>
                <input
                  type="number"
                  class="form-control ms-3"
                  id="buyCounter"
                  v-model="buyCounter"
                  :max="productKartya.quantity"
                />
              </div>

              <button
                type="button"
                class="btn btn-success buyButton ms-3"
                data-bs-dismiss="modal"
                @click="vasarlas()"
                v-if="storeLogin.loginSuccess"
              >
                Vásárlás <i class="bi bi-cart"></i>
              </button>

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

<script>
class Cart{
  constructor(){
    this.userId = null;
    this.productId = null;
    this.shoppingDate = null;
    this.bought = null;
    this.quantity = null;
    this.price = null;
    this.shoppingId = null;
  }
}

class ProductKartya {
  constructor() {
    this.id = null;
    this.productName = null;
    this.quantity = null;
    this.price = null;
    this.isInStock = null;
  }
}

import { storeToRefs } from "pinia";
import * as bootstrap from "bootstrap";
import { useKeresStore } from "@/stores/keres";
import { useLoginStore } from "@/stores/login";
import { useUrlStore } from "@/stores/url";
const storeKeres = useKeresStore();
const { keresoszo } = storeToRefs(storeKeres);
const storeLogin = useLoginStore();
const storeUrl = useUrlStore();

export default {
  data() {
    return {
      cart: new Cart(),
      buyCounter: 0,
      storeLogin,
      storeUrl,
      products: [],
      urlProducts: "http://localhost:3000/products",
      urlProductsSzur: "http://localhost:3000/productsSzur",
      productKartya: new ProductKartya(),
      productId: null,
      keresoszo,
    };
  },
  mounted() {
    this.getProductKartyak();
    this.modal = new bootstrap.Modal(document.getElementById("modalProduct"), {
      keyboard: false,
    });
  },
  watch: {
    keresoszo() {
      if (this.keresoszo.trim()) {
        this.getProductKartyakSzur();
      } else {
        this.getProductKartyak();
      }
    },
  },
  methods: {
    async getProductKartyak() {
      const url = this.storeUrl.urlProducts;
      const response = await fetch(url);
      const data = await response.json();
      this.products = data.data;
    },
    async getProductKartya(id) {
      const urlProducts = `${this.storeUrl.urlProducts}/${id}`;
      const response = await fetch(urlProducts);
      const data = await response.json();
      this.productKartya = data.data[0];
    },
    onClickReszletek(id) {
      this.productId = id;
      this.getProductKartya(id);
      this.modal.show();
      buyCounter = 0;
    },
    vasarlas() {
      this.cart.userId = this.storeLogin.userId;
      this.cart.productId = this.productId;
      this.cart.bought = false;
      this.cart.quantity = this.buyCounter;
      this.cart.price = this.productKartya.price;
      this.cart.shoppingId = this.storeLogin.shoppingId;
      console.log(this.cart);
    },
    async getProductKartyakSzur() {
      const urlProducts = `${this.storeUrl.urlProductsSzur}/${this.keresoszo}`;
      const response = await fetch(urlProducts);
      const data = await response.json();
      this.products = data.data;
    },
    keresJelol(text) {
      if (this.keresoszo) {
        let what = new RegExp(this.keresoszo, "gi");
        if (text) {
          text = text.replace(what, (match) => {
            return `<span class="mark">${match}</span>`;
          });
        }
        return text;
      } else {
        return text;
      }
    },
  },
};
</script>

<style>
.buyButton {
  margin-right: 15px;
}
/* .card{
  min-width: 200px;
  max-width: 200px;
  min-height: 200px;
  max-height: 300px;
} */

/* h5{
  font-weight: bold;
}

 .modal-body {
  max-height: calc(100vh - 180px);
  overflow-y: auto;
}
  
.modal-backdrop {
    display: none;
    z-index: 1040 !important;
}

.modal-content {
    margin: 2px auto;
    z-index: 1100 !important;
}  */
</style>