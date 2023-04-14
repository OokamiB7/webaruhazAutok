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
                <button
                  type="button"
                  class="btn btn-primary"
                  data-bs-toggle="modal"
                  data-bs-target="#exampleModal"
                 
                >
                  Kosárba
                </button>
              </div>
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

export default {
  data() {
    return {
      products: [],
      urlProducts: "http://localhost:3000/products",
      productKartya: new ProductKartya()
    };
    
  },
  mounted(){
    this.getProductKartya();
  },
  methods: {
    async getProductKartya() {
      const response = await fetch(this.urlProducts);
      const data = await response.json();
      this.products = data.data;
    },
    async getHalkartya() {
      const urlProducts = `${this.urlProducts}`;
      const response = await fetch(urlProducts);
      const data = await response.json();
      this.productKartya = data.data[0];
    },
  }
}
</script>

<style>
  
</style>