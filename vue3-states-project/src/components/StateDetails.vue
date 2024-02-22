<template>
  <div class="state-details" v-if="state">
    <h2>{{ state.state }}</h2>
    <p>Population: {{ state.population }}</p>
    <p>Number of Counties: {{ state.counties_obj.length }}</p>
    <ul>
      <li v-for="county in state.counties_obj" :key="county.state">{{ county.county }} - Population: {{ county.population }}</li>
    </ul>
    <p>Total County Population: {{ totalCountyPopulation }}</p>
    <p v-if="isCountyPopulationEqual">County Population Equals State Record</p>
    <p v-else>County Population Does Not Equal State Record</p>
  </div>
</template>

<script>
import { computed } from 'vue';

export default {
  props: {
    state: Object
  },
  setup(props) {
    const totalCountyPopulation = computed(() => {
      if (props.state) {
        return props.state.counties_obj.reduce((acc, county) => acc + county.population, 0);
      }
      return 0;
    });

    const isCountyPopulationEqual = computed(() => {
      return totalCountyPopulation.value === props.state.population;
    });

    return {
      totalCountyPopulation,
      isCountyPopulationEqual
    };
  }
};
</script>

<style scoped>
/* Add your styles here */
.state-details {
  flex: 2;
}

.state-details h2 {
  margin-bottom: 10px;
}

.state-details ul {
  list-style-type: none;
  padding: 0;
}
.state-details {
   max-height: 200px;
  overflow-y: auto;
}
 
</style>
