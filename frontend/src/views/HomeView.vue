<template>
  <div>

    <div class="home-container">
    <h1 class="Cim">Üdvözöljük</h1>
    <div class="bevezetoDiv">
      <p class="szoveg">Webáruházunk segítésgével az otthonából tud Forzathon termékeket rendelni az ország bármely pontjáról. A forzathon Magyarország legnagyobb autóalkatrész üzletlánca. 1988 óta működünk és csak minőségi alkatrészeket nyújtunk kedves vásárlóinknat. Itt a Forzathonnál a legfontossabb számunkra az a vásárlóink mosolya. További információkért fáradjon a GYIK felülethez vagy érdeklődjön telefonon!</p>
      
      <h2 class="kisCim">Most felkapott:</h2>

      <div class="card" style="width: 18rem;">
        <div class="card-body">
        <h5 class="card-title">BBS Felni - 17'</h5>
        <p class="card-text">Ár: 45000Ft</p>
        <button type="button" class="btn btn-dark"><router-link class="nav-link" to="/aruhaz">Látogasd meg</router-link></button>
        </div>
      </div>

      <div class="card" style="width: 18rem;">
        <div class="card-body">
        <h5 class="card-title">Fékpofa</h5>
        <p class="card-text">Ár: 13500Ft</p>
        <button type="button" class="btn btn-dark"><router-link class="nav-link" to="/aruhaz">Látogasd meg</router-link></button>
        </div>
      </div>

      <div class="card" style="width: 18rem;">
        <div class="card-body">
        <h5 class="card-title">Ülések</h5>
        <p class="card-text">Ár: 37000Ft</p>
        <button type="button" class="btn btn-dark"><router-link class="nav-link" to="/aruhaz">Látogasd meg</router-link></button>
        </div>
      </div>

      <div class="card" style="width: 18rem;">
        <div class="card-body">
        <h5 class="card-title">Katalizátor</h5>
        <p class="card-text">Ár: 553000Ft</p>
        <button type="button" class="btn btn-dark"><router-link class="nav-link" to="/aruhaz">Látogasd meg</router-link></button>
        </div>
      </div>

            <div class="card" style="width: 18rem;">
        <div class="card-body">
        <h5 class="card-title">Benzines kanna</h5>
        <p class="card-text">Ár: 7500Ft</p>
        <button type="button" class="btn btn-dark"><router-link class="nav-link" to="/aruhaz">Látogasd meg</router-link></button>
        </div>
      </div>

      <div class="card" style="width: 18rem;">
        <div class="card-body">
        <h5 class="card-title">Csavarok</h5>
        <p class="card-text">Ár: 750Ft</p>
        <button type="button" class="btn btn-dark"><router-link class="nav-link" to="/aruhaz">Látogasd meg</router-link></button>
        </div>
      </div>

  
    </div>

    <div class="elerhetosegDiv">
      <p class="szoveg">Elérhetőségek: </p>
      <img id="lalo" src="imgs/lalo.jpg" alt="">
      <p class="szoveg">Farkas Bence, vezérigazgató</p>
      <p class="szoveg">Tel.: 3620123456</p>
      <p class="szoveg">Hétfő-Péntek (9:00 - 18:00)</p>
    </div>


    </div>






  </div>
</template>

<script setup>

</script>

<style>

.btn{
  color: gold;
}

.card{
  overflow: hidden;
  float: left;
  background-color: #FBAB7E;
  background-image: linear-gradient(62deg, #FBAB7E 0%, #F7CE68 100%);
  color: black;
  font-weight: bold;
  text-align: center;
  margin: 5px;
}

.home-container{
  overflow: hidden;
}

#lalo{
  height: 250px;
  border-radius: 8px;
}

.bevezetoDiv{
  max-width: 800px;
  margin: 10px;
  float: left;
}

.elerhetosegDiv{
  max-width: 500px;
  margin: 10px;
  float: right;
  padding: 10px;
  text-align: center;
}

#cim{
  text-align: center;
  font-style: oblique;
  padding-bottom: 50px;
}

</style>
