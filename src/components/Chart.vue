<script>
import {Line, mixins} from 'vue-chartjs';

const {reactiveProp} = mixins;
export default {
  extends: Line,
  mixins: [reactiveProp],
  props: {
    label: {
      type: String
    },
    chartData: {
      type: Array
    },
    options: {
      type: Object
    },
    chartColors: {
      type: Object
    }
  },
  mounted() {
    this.renderLineChart();
  },

  methods: {
    renderLineChart: function () {
      const dates = this.chartData.map(d => d.date);
      const {
        borderColor,
        pointBorderColor,
        pointBackgroundColor,
        backgroundColor
      } = this.chartColors;

      this.renderChart(
          {
            labels: dates,
            datasets: [
              {
                label: this.label,
                data: this.chartData.map(d => d.ratio),
                borderColor: borderColor,
                pointBorderColor: pointBorderColor,
                pointBackgroundColor: pointBackgroundColor,
                backgroundColor: backgroundColor
              }
            ]
          },
          this.options
      );
    }
  }
};
</script>
