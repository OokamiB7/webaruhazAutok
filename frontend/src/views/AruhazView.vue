<template>
  <div>
    <h1 id="cim">Áruház</h1>


     <div class="col-md-12 my-border">
        <div
          class="row row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-4"
        >
          <!-- kártya temlate -->
          <div class="col" v-for="(product, index) in products" :key="index">
            <div class="card">
              
              <div class="card-body">
                <h5 class="card-title" v-html="product.productName"></h5>
                <p> Ár: {{ product.price}}Ft</p>
                <p> Raktáron: {{ product.quantity}}DB</p>

                <button
                  type="button"
                  class="btn btn-primary"
                  data-bs-toggle="modal"
                  data-bs-target="#exampleModal"
                 @click="onClickReszletek(hal.FejezetId)"
                >
                  Kosárba
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    
    <!-- modal -->
    <div
      class="modal fade"
      id="exampleModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel" v-html="productKartya.productName">
             
            </h1>
            
          </div>
          <div class="modal-body">
            <table class="table table-success">
              <thead>
                <tr>
                  <th>Ár: </th>
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
            </table>

            <!-- <img
                :src="`/public/kepek/${halKartya.KepFile}`"
                class="card-img-top"
                alt="..."
              /> -->

             

          </div>
          <div class="modal-footer">
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


export default {
  data() {
    return {
      products: [],
      urlProducts: "http://localhost:3000/products",
      productKartya: new ProductKartya(),
      productId: null
    };
    
  },
  mounted(){
    this.getProductKartyak();
  },
  methods: {
    async getProductKartyak() {
      const response = await fetch(this.urlProducts);
      const data = await response.json();
      this.products = data.data;
    },
    async getProductKartya() {
      const urlProducts = `${this.urlProducts}`;
      const response = await fetch(urlProducts);
      const data = await response.json();
      this.productKartya = data.data[0];
    },
        onClickReszletek(productId) {
      this.productId = productId;
      this.getProductKartya();
    },

  }
}
</script>

<style>
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
}

</style>