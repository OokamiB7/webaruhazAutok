<template>
    <div>
  
      <div class="home-container">
      <h1 class="Cim">Üdvözöljük</h1>
      <div class="bevezetoDiv">
        <p class="szoveg">Webáruházunk segítésgével az otthonából tud Forzathon termékeket rendelni az ország bármely pontjáról. A forzathon Magyarország legnagyobb autóalkatrész üzletlánca. 1988 óta működünk és csak minőségi alkatrészeket nyújtunk kedves vásárlóinknat. Itt a Forzathonnál a legfontossabb számunkra az a vásárlóink mosolya. További információkért fáradjon a GYIK felülethez vagy érdeklődjön telefonon!</p>
        <div class="gyikDiv">
          <h1 >GYIK</h1>
          <p class="kerdes">-Hogyan adhatok kedvezményt a rendelésemhez?</p>
          <ul >Kedvezménykódokat a kosárban vagy a fizetésnél adhatsz meg.</ul>
          <p class="kerdes">-Lefoglalhatom a kosaramba tett árukat?</p>
          <ul>Egy áru foglalása csak akkor történik meg, amikor a fizetést elvégezted. A kosaradba tett árukat 7 napig őrizzük, de elérhetőségük nem garantált. Ha egy árucikk nagyon népszerű, akkor előfordulhat, hogy a kosárba helyezésekor még elérhető, de a kifizetéshez érve már elfogyott.</ul>
          <p class="kerdes">-Lemondhatom vagy módosíthatom a rendelésemet?</p>
          <ul>Gyorsan elkezdjük a megrendelésed feldolgozását, ezért a megerősítését követően nem tudjuk módosítani. Ez a szállítási cím vagy a szállítási mód megváltoztatására is érvényes. </ul>
          <ul>Lehetőséged van azonban a rendelésed lemondására és helyette egy új rendelés leadására, mivel közvetlenül a rendelésed megerősítése után egy rövid türelmi időt biztosítunk számodra.</ul>
          <p class="kerdes">-Mennyi a szállítási idő és mennyibe kerül a szállítás?</p>
          <ul>A szállítási idő a raktári kapacitásunk függvényében változhat , általában 2-10 munkanap. A megrendelésed követően 48 órán belül felvesszük veled a kapcsolatot  és tájékoztatunk a pontos kiszállítás dátumáról.</ul>
          <p class="kerdes">-Mit tegyek, ha sérült vagy nem megfelelő terméket kaptam?</p>
          <ul>Amennyiben  a  termék szállítás során sérült meg és a csomagoláson külsérelmi nyomokat találsz, kérlek ne vedd át a csomagot a futártól, küld vissza! Ha  a kicsomagolás után  látod, hogy a termék hibás, fotózd le és küld el részünkre emailban a rendelés azonosító számával, valamint a hiba részletes leírásával, kollégánk 48 órán belül válaszolni fog leveledre! Amennyiben nem megfelelő terméket kaptál, hívd ügyfélszolgálatunkat, ahol kollégáink készséggel állnak a rendelkezésedre  és tájékoztatnak  a lehetséges csere módokról!</ul>
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

  .home-container{
    backdrop-filter: blur(10px);
  }

  .kerdes{
    font-weight: bold;
    font-size: 20px;
  }

  .gyikDiv{
    color: white;
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
    overflow: hidden;
  }
  
  #cim{
    text-align: center;
    font-style: oblique;
    padding-bottom: 50px;
  } 
  
  </style>
  