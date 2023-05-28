<template>
  <div>
    <h1 class="srCim"><i class="bi bi-check-circle"></i></h1>
    <h1 class="keszCim">Sikeres rendelés!</h1>
    <h2 class="keszAlcim">Email címére elküldtük a nyugtát. Várhatóan a termék 1-3 munkanapon belül érkezik.</h2>
    <h2 class="keszAlcim p-5">Köszönjük, hogy minket választott!</h2>
  </div>
</template>

<script>
export default {

}
</script>

<style>

.srCim{
    font-size: 150px;
    color: gold;
    text-align: center;
}

.keszCim{
    background: linear-gradient(60deg, #E21143, #FFB03A);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-align: center;
    font-size: 75px;
}

.keszAlcim{
    text-align: center;
    color: white;
    font-size: 30px;
}

</style>