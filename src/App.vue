<template>
  <div id="app">
    <header class="text-center text-white">
      <h1 class="display-4">Užsienio valiutų kursai</h1>
    </header>
    <Cards/>
    <CurrencyChart/>
    <Currencies/>
    <CalculatedAmount/>
  </div>
</template>

<script>


import Currencies from "@/components/Currencies";
import CalculatedAmount from "@/components/CalculatedAmount";
import Cards from "@/components/currencies/cards/Cards";
import CurrencyChart from "@/components/CurrencyChart";

const app = {

  name: 'app',
  components: {
    Cards,
    Currencies,
    CurrencyChart,
    CalculatedAmount,
  },
  data: () => {
    return {
      isActive: false
    }
  },
}
export default app
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  /*margin-top: 20px;*/
  background-color: #aba4a4;

}

header {
  background: #2c3e50;
}
</style>
