<template>
  <div>
    <h1>Index</h1>
  </div>
</template>

<script setup>
import Counter from "@/components/Counter.vue";
import { useCounterStore } from "@/stores/counter";
const storeCounter = useCounterStore();
</script>

<style>

</style>
