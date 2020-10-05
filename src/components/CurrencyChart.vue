<template>
  <div class="container body">
    <div class="row mt-5">
      <div class="col">
        <h1 class="text-center ">Valiutos kurso kitimo istorija</h1>
      </div>
    </div>
    <select v-model="input">
      <option disabled value="">Pasirinkite valiutą</option>
      <option>Australijos doleris</option>
      <option>Čekijos krona</option>
      <option>Danijos krona</option>
      <option>Didžiosios Britanijos svaras</option>
      <option>Japonijos juanis</option>
      <option>Norvegijos krona</option>
      <option>Lenkijos zlotas</option>
      <option>Rusijos rublis</option>
      <option>Švedijos krona</option>
      <option>JAV doleris</option>
    </select>
    <button class="Search__button" @click="change">Rasti</button>
    <div class="row mt-5" v-if="this.isLoaded">
      <div class="col">
        <chart
            :chart-data="arrPositive"
            :options="chartOptions"
            :chartColors="positiveChartColors"
            label="valiuta"
        />
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Chart from "@/components/Chart"
import api from "@/Api"

export default {
  components: {
    Chart,
  },
  data() {
    return {
      input: '',
      countries: Array,
      isLoaded: false,
      arrPositive: [],
      positiveChartColors: {
        borderColor: "#077187",
        pointBorderColor: "#3455c3",
        pointBackgroundColor: "#AFD6AC",
        backgroundColor: "#74A57F"
      },
      chartOptions: {
        responsive: true,
        maintainAspectRatio: false
      }
    };
  },
  methods: {
    reset: function () {
      this.isLoaded = false;
      this.arrPositive = [];
    }
    ,
    change: async function () {
      this.reset();
      const {data} = await axios.get(" http://localhost:9000/api/currencies/history/".concat(this.input));

      data.forEach(d => {
        const date = d.date;
        const ratio = d.ratio;
        this.arrPositive.push({date, ratio: ratio});
      });
      console.log(this.arrPositive)
      this.isLoaded = true;
    }
  }
  ,
  created() {
    api.getCountries().then(response => {
      this.countries = response.data;
    })
    console.log(this.countries)
  }
}
;
</script>

<style>
</style>

<style scoped>
.body {
  background-color: #d9d7d7;
}
</style>

