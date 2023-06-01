<template>
  <div>
    <h1 class="Cim">Rendelés</h1>
    <p class="szoveg p-1">A *-al jelölt mezők kitöltése kötelező</p>
    <div class="row">
      <div class="col-md-3 m-3">
        <div>
          <label for="szamlazasiNev" class="szoveg">Számlázási név*</label>
          <input type="text" class="form-control" id="szamlazasiNev" />
        </div>

        <div>
          <label for="szamlazasiNev" class="szoveg">Email*</label>
          <input type="text" class="form-control" id="szamlazasiNev" />
        </div>

        <div>
          <label for="telefonszam" class="szoveg">Telefonszám*</label>
          <input
            type="number"
            class="form-control"
            id="telefonszam"
            placeholder="+36"
          />
        </div>
      </div>

      <div class="col-md-4 p-3">
        <label for="cim" class="szoveg">Cím*</label>
        <input
          type="text"
          class="form-control"
          id="cim"
          placeholder="Ország - Irányítószám - Település - Házszám"
        />

        <label for="kupon" class="szoveg">Kuponkód</label>
        <input type="text" class="form-control" id="kupon" />
      </div>

      <div class="col-md-7 mb-3 p-3">
        <label for="exampleFormControlTextarea1 " class="form-label szoveg"
          >Üzenet a futárnak</label
        >
        <textarea
          class="form-control"
          id="exampleFormControlTextarea1"
          rows="3"
        ></textarea>
      </div>
    </div>

    
        <div class="col-md-12 ">
            <router-link to="/">
                <button type="button" class="btn btn-danger m-2">Vissza</button>
            </router-link>
            <router-link to="sikeresRendeles">
              <button type="button" class="btn btn-success" @click="cartKiurul()">Megrendelem</button>
            </router-link>
        </div>
    
        

  </div>
</template>

<script>
import * as bootstrap from "bootstrap";
import { useUrlStore } from "@/stores/url";
import { useLoginStore } from "@/stores/login";
import { useKeresStore } from "@/stores/keres";
import { ref } from "vue";
const storeKeres = useKeresStore();
const storeUrl = useUrlStore();
const storeLogin = useLoginStore();

export default {
  data(){
    return {
      storeLogin
    };
  },
  mounted() {
    

  },
  methods: {
     cartKiurul(){
      storeLogin.cartCount = 0;
    }
  }
}


</script>

<style>
label {
  font-size: 20px;
}


</style>
