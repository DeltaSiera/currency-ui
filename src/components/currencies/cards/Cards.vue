<template>
  <div class="container">
    <div><h2>Šiandienos valiutų kursai</h2>
    </div>
    <div class="row">
      <div class="card-group">
        <div class="flip-card">
          <div class="flip-card-inner">
            <div class="flip-card-front">
              <img src="@/assets/aud.png" alt="Avatar" style="width:200px;height:100px;">
            </div>
            <div class="flip-card-back">
              <p>Australijos doleris</p>
              <p>Kursas šiandien: {{ ratio("AUD") }}</p>
              <p>Data: {{ date(0) }}</p>
            </div>
          </div>
        </div>
        <div class="flip-card">
          <div class="flip-card-inner">
            <div class="flip-card-front">
              <img src="@/assets/czk.png" alt="Avatar" style="width:200px;height:100px;">
            </div>
            <div class="flip-card-back">
              <p>Čekijos krona</p>
              <p>Kursas šiandien: {{ ratio("CZK") }}</p>
              <p>Data: {{ date(1) }}</p>
            </div>
          </div>
        </div>
        <div class="flip-card">
          <div class="flip-card-inner">
            <div class="flip-card-front">
              <img src="@/assets/dkk.png" alt="Avatar" style="width:200px;height:100px;">
            </div>
            <div class="flip-card-back">
              <p>Danijos krona</p>
              <p>Kursas šiandien: {{ ratio("DKK") }}</p>
              <p>Data: {{ date(2) }}</p>
            </div>
          </div>
        </div>
        <div class="flip-card">
          <div class="flip-card-inner">
            <div class="flip-card-front">
              <img src="@/assets/gbp.png" alt="Avatar" style="width:200px;height:100px;">
            </div>
            <div class="flip-card-back">
              <p>Didžiosios Britanijos svaras</p>
              <p>Kursas šiandien: {{ ratio("GBP") }}</p>
              <p>Data: {{ date(3) }}</p>
            </div>
          </div>
        </div>
        <div class="flip-card">
          <div class="flip-card-inner">
            <div class="flip-card-front">
              <img src="@/assets/jap.png" alt="Avatar" style="width:200px;height:100px;">
            </div>
            <div class="flip-card-back">
              <p>Japonijos jena</p>
              <p>Kursas šiandien: {{ ratio("JPY") }}</p>
              <p>Data: {{ date(4) }}</p>
            </div>
          </div>
        </div>
        <div class="flip-card">
          <div class="flip-card-inner">
            <div class="flip-card-front">
              <img src="@/assets/nor.png" alt="Avatar" style="width:200px;height:100px;">
            </div>
            <div class="flip-card-back">
              <p>Norvegijos krona</p>
              <p>Kursas šiandien: {{ ratio("NOK") }}</p>
              <p>Data: {{ date(5) }}</p>
            </div>
          </div>
        </div>
        <div class="flip-card">
          <div class="flip-card-inner">
            <div class="flip-card-front">
              <img src="@/assets/pol.png" alt="Avatar" style="width:200px;height:100px;">
            </div>
            <div class="flip-card-back">
              <p>Lenkijos zlotas</p>
              <p>Kursas šiandien: {{ ratio("PLN") }}</p>
              <p>Data: {{ date(6) }}</p>
            </div>
          </div>
        </div>
        <div class="flip-card">
          <div class="flip-card-inner">
            <div class="flip-card-front">
              <img src="@/assets/rus.png" alt="Avatar" style="width:200px;height:100px;">
            </div>
            <div class="flip-card-back">
              <p>Rusijos rublis</p>
              <p>Kursas šiandien: {{ ratio("RUB") }}</p>
              <p>Data: {{ date(7) }}</p>
            </div>
          </div>
        </div>
        <div class="flip-card">
          <div class="flip-card-inner">
            <div class="flip-card-front">
              <img src="@/assets/swe.png" alt="Avatar" style="width:200px;height:100px;">
            </div>
            <div class="flip-card-back">
              <p>Švedijos krona</p>
              <p>Kursas šiandien: {{ ratio("SEK") }}</p>
              <p>Data: {{ date(8) }}</p>
            </div>
          </div>
        </div>
        <div class="flip-card">
          <div class="flip-card-inner">
            <div class="flip-card-front">
              <img src="@/assets/usa.png" alt="Avatar" style="width:200px;height:100px;">
            </div>
            <div class="flip-card-back">
              <p>JAV doleris</p>
              <p>Kursas šiandien: {{ ratio("USD") }}</p>
              <p>Data: {{ date(9) }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Api from "@/Api";

export default {
  name: "Cards",
  data: () => {
    return {
      countries: ["AUD", "CZK", "DKK", "GBP", "JPY", "NOK", "PLN", "RUB", "SEK", "USD"],
      info: [],
    }
  },
  methods: {
    ratio: function (index) {
      return this.info.find(d => d.name === index).ratio
    },
    date: function (i) {
      return this.info[i].date;
    }
  },
  created() {
    this.countries.forEach(c => Api.getNewestByName(c).then(result => {
      const name = result.data.name;
      const ratio = result.data.ratio;
      const date = result.data.date;
      this.info.push({name: name, ratio: ratio, date: date});
    }));
  }
}
</script>

<style scoped>
.flip-card {
  background-color: transparent;
  width: 200px;
  height: 100px;
  /*border: 1px solid #f1f1f1;*/
  perspective: 1000px; /* Remove this if you don't want the 3D effect */
  margin: 14px;
}

/* This container is needed to position the front and back side */
.flip-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.5s;
  transform-style: preserve-3d;
}

/* Do an horizontal flip when you move the mouse over the flip box container */
.flip-card:hover .flip-card-inner {
  transform: rotateY(180deg);
}

/* Position the front and back side */
.flip-card-front, .flip-card-back {
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden; /* Safari */
  backface-visibility: hidden;
}

/* Style the front side (fallback if image is missing) */
.flip-card-front {
  background-color: #bbb;
  color: black;
}

/* Style the back side */
.flip-card-back {
  background-color: #7c9fc6;
  color: white;
  transform: rotateY(180deg);
}
</style>
