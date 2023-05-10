<template>
  <div class="p-3">
    <h1 class="Cim">Kínálataink</h1>

    <div class="col-md-12 my-border">
      <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4">
        <!-- kártya temlate -->
        <div class="col" v-for="(product, index) in products" :key="index">
          <div class="card my-bg-card">
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
            <!-- <table class="table table-dark">
              <thead>
                <tr>
                  <th>Ár:</th>
                  <th>Darab</th>
                  <th>Raktáron</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>{{ productKartya.price }}</td>
                  <td>{{ productKartya.quantity }}</td>
                  <td>{{ productKartya.isInStock }}</td>
                </tr>
              </tbody>
            </table> -->

            <p>Ár: {{ productKartya.price }}Ft</p>
            <p>Darab: {{ productKartya.quantity }}DB</p>
            <p>Raktáron: {{ productKartya.isInStock }}DB</p>
            <p>{{ productKartya.description }}</p>

            <img class="card-img-top product-image" src="../images/Plüss dobókocka.jpg" alt="Áru képe">


             
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-primary"
              data-bs-dismiss="modal"
            >
              Vásárlás
            </button>

            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Close
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
class ProductKartya {
  constructor() {
    this.productName = null;
    this.quantity = null;
    this.price = null;
    this.isInStock = null;
  }
}

import { storeToRefs } from "pinia";
import * as bootstrap from "bootstrap";
import { useKeresStore } from "@/stores/keres";
const storeKeres = useKeresStore();
const { keresoszo } = storeToRefs(storeKeres);

export default {
  data() {
    return {
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
    keresoszo(){
      if (this.keresoszo.trim()) {
        this.getProductKartyakSzur();
      } else {
        this.getProductKartyak();
      }
    }
  },
  methods: {
    async getProductKartyak() {
      const response = await fetch(this.urlProducts);
      const data = await response.json();
      this.products = data.data;
    },
    async getProductKartya(id) {
      const urlProducts = `${this.urlProducts}/${id}`;
      const response = await fetch(urlProducts);
      const data = await response.json();
      this.productKartya = data.data[0];
    },
    onClickReszletek(id) {
      this.productId = id;
      this.getProductKartya(id);
      this.modal.show();
    },
    async getProductKartyakSzur() {
      const urlProducts = `${this.urlProductsSzur}/${this.keresoszo}`;
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