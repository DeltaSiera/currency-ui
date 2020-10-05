<template>
  <div class="container py-5 check">
    <div class="row py-5">
      <div class="col-lg-10 mx-auto">
        <div class="card rounded shadow border-0">
          <div class="card-body p-5 bg-white rounded">
            <div class="table-responsive">
              <h2>Naujausi valiutų kursai</h2>
              <table id="example" style="width:100%" class="table table-striped table-bordered">
                <thead>
                <tr>
                  <th>Pavadinimas</th>
                  <th>Kursas</th>
                </tr>
                </thead>
                <tbody v-bind:key="c.id" v-for="c in cur">
                <tr>
                  <th>{{ c.name }}</th>
                  <th>{{ c.ratio }}</th>
                </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import api from '../Api';

export default {
  name: "Currencies",
  data: function () {
    return {
      cur: []
    }
  },
  mounted() {
    api.getNewest()
        .then(response => this.cur = response.data)
  }


}
</script>

<style scoped>
.check {
  font-size: 10px;
  min-height: 100vh;
  text-align: center;
  background-color: #FFE53B;
  background-image: linear-gradient(147deg, #e2e0d4 0%, #ecdcdc 100%);
}
</style>
