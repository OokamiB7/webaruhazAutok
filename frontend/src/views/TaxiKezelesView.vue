
<template>
  <div>
    <h1 class="Cim">Áru kezelés</h1>

    <!--#region táblázat -->
    <table class="table  table-striped table-dark table-bordered w-auto szoveg">
      <thead>
        <tr>
          <th>
            <!-- New product -->
            <button
              type="button"
              class="btn btn-outline-success btn-sm"
              @click="onClickNew()"
            >
              Új áru
            </button>
          </th>
          <th>Áru név</th>
          <th>Darab</th>
          <th>Ár</th>
          <th>Raktáron</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="(product, index) in products"
          :key="`product${index}`"
          :class="currentRowBackground(product.id)"
          @click="onClikRow(product.id)"
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

            <!-- módosítás -->
            <button
              type="button"
              class="btn btn-outline-primary btn-sm ms-2"
              @click="onClickEdit(product.id)"
            >
              <i class="bi bi-pencil-fill"></i>
            </button>
          </td>
          <td class="fasz">{{ product.productName }}</td>
          <td class="fasz">{{ product.quantity }}</td>
          <td class="fasz">{{ product.price }}</td>
          <td class="fasz">{{ product.isInStock }}</td>
        </tr>
      </tbody>
    </table>
    <!--#endregion táblázat -->

    <!--#region Modal -->
    <div
      class="modal fade"
      id="modalProduct"
      tabindex="-1"
      aria-labelledby="modalProductModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">
              {{ stateTitle }}
            </h1>
            <button
              type="button"
              class="btn-close"
              @click="onClickCancel()"
              aria-label="Close"
            ></button>
          </div>

          <!--#region Modal body -->
          <div class="modal-body">
            <!--#region Form -->

            <form class="row g-3 needs-validation" novalidate>
              <!-- Áru név -->
              <div class="col-md-12">
                <label for="productName" class="form-label">Áru név</label>
                <input
                  type="text"
                  class="form-control"
                  id="productName"
                  required
                  v-model="editableProduct.productName"
                />
                <div class="invalid-feedback">A név kitöltése kötelező</div>
              </div>

              <!-- Darab -->
              <div class="col-md-6">
                <label for="quantity" class="form-label">Darab</label>
                <input
                  type="number"
                  class="form-control"
                  id="quantity"
                  required
                  v-model="editableProduct.quantity"
                />
                <div class="invalid-feedback">
                  A darab kitöltése kötelező
                </div>
              </div>

              <!-- Ár -->
              <div class="col-md-6">
                <label for="price" class="form-label"
                  >Ár</label
                >
                <input
                  type="number"
                  class="form-control"
                  id="price"
                  required
                  v-model="editableProduct.price"
                />
                <div class="invalid-feedback">Az ár kitöltése kötelező</div>
              </div>

              <!-- Raktáron -->
              <div class="col-md-6">
                <label for="isInStock" class="form-label"
                  >Raktáron</label
                >
                <input
                  type="number"
                  class="form-control"
                  id="isInStock"
                  required
                  v-model="editableProduct.isInStock"
                />
                <div class="invalid-feedback">A raktáron kitöltése kötelező</div>
              </div>
            </form>
            <!--#endregion Form -->
          </div>
          <!--#endregion Modal body -->

          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              @click="onClickCancel()"
            >
              Close
            </button>
            <button
              type="button"
              class="btn btn-primary"
              
              @click="onClickSave()"
            >
              Save changes
            </button>
          </div>
        </div>
      </div>
    </div>
    <!--#endregion Modal -->
  </div>
</template>

<script>
import * as bootstrap from "bootstrap";
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();

class Product {
  constructor(
    id = 0,
    productName = null,
    quantity = null,
    price = null,
    isInStock = null,
  ) {
    this.id = id;
    this.productName = productName;
    this.quantity = quantity;
    this.price = price;
    this.isInStock = isInStock;
  }
}

export default {
  data() {
    return {
      storeUrl,
      storeLogin,
      products: [],
      editableProduct: new Product(),
      modal: null,
      form: null,
      state: "view",
      currentId: null,
    };
  },
  mounted() {
    this.getProducts();
    this.modal = new bootstrap.Modal(document.getElementById("modalProduct"), {
      keyboard: false,
    });

    this.form = document.querySelector(".needs-validation");
  },
  methods: {
    async getProducts() {
      let url = this.storeUrl.urlProducts;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.products = data.data;
    },
    async getProductById(id) {
      let url = `${this.storeUrl.urlProducts}/${id}`;
      const config = {
        method: "GET",
        headers: {
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      const data = await response.json();
      this.editableProduct = data.data[0];
    },

    async postProduct() {
      let url = this.storeUrl.urlProducts;
      const body = JSON.stringify(this.editableProduct);
      const config = {
        method: "POST",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
        body: body,
      };
      const response = await fetch(url, config);
      this.getProducts();
    },
    async putProduct() {
      const id = this.editableProduct.id;
      let url =`${this.storeUrl.urlProducts}/${id}`;
      const body = JSON.stringify(this.editableProduct);
      const config = {
        method: "PUT",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
        body: body,
      };
      const response = await fetch(url, config);
      this.getProducts();
    },
    async deleteProduct(id) {
      let url = `${this.storeUrl.urlProducts}/${id}`;
      const config = {
        method: "DELETE",
        headers: {
          "content-type": "application/json",
          Authorization: `Bearer ${this.storeLogin.accessToken}`,
        },
      };
      const response = await fetch(url, config);
      this.getProducts();
    },
    onClikRow(id) {
      this.currentId = id;
    },
    onClickNew() {
      this.state = "new";
      this.currentId = null;
      this.editableProduct = new Product();
      this.modal.show();
    },
    onClickDelete(id) {
      this.state = "delete";
      this.deleteProduct(id);
      this.currentId = null;
    },
    onClickEdit(id) {
      this.state = "edit";
      this.getProductById(id);
      this.modal.show();
    },
    onClickCancel() {
      this.editableProduct = new Product();
      this.modal.hide();
    },
    onClickSave() {
      this.form.classList.add("was-validated");
      if (this.form.checkValidity()) {
        if (this.state == "edit") {
          //put
          this.putProduct();
          // this.modal.hide();
        } else if (this.state == "new") {
          //post
          this.postProduct();
          // this.modal.hide();
        }
        this.modal.hide();
        //frissíti a taxisok listáját
      }
    },
    currentRowBackground(id) {
      return this.currentId == id ? "my-bg-current-row" : "";
    },
  },
  computed: {
    stateTitle() {
      if (this.state === "new") {
        return "Új áru bevitele";
      } else if (this.state === "edit") {
        return "Áru módosítása";
      }
    },
  },
};
</script>


<style>
/* .my-bg-current-row {
  background-color: lightgrey;
} */

body.modal-open {
  overflow: hidden;
}

.modal-backdrop {
    display: none;
    z-index: 1040 !important;
}

.modal-content {
    margin: 2px auto;
    z-index: 1100 !important;
}

body{
  color: red;
}

table{
  margin: 10px;
}

tr:hover{
  cursor: default;
}



</style>
