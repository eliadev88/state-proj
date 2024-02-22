<template>
  <div id="state-view" class="state-view-container">
    <div class="list-container">
      <h2>All States</h2>
      <StateList :states="states" @state-click="showStateDetails" @state-dblclick="toggleHighlight" />
    </div>
    <div class="list-container">
      <h2>Filtered States</h2>
      <FilteredStateList :filtered-states="filteredStates" @state-click="showStateDetails" @state-dblclick="toggleHighlight" />
    </div>
    <StateDetails :state="selectedState" />
  </div>
</template>

<script>
import { ref, computed } from 'vue';
import axios from 'axios';
import StateList from '../components/StateList.vue'; 
import FilteredStateList from '../components/FilteredStateList.vue'; 
import StateDetails from '../components/StateDetails.vue'; 

export default {
  name: 'StateView',
  components: {
    StateList,
    FilteredStateList,
    StateDetails
  },
  setup() {
    const selectedState = ref(null);
    const states = ref([]);
    const filterText = ref('');

    const fetchData = async () => {
      try {
        const response = await axios.get('http://localhost:3000/states');
        if (response.data && Array.isArray(response.data)) {
          states.value = response.data;
        } else {
            states.value = getDummyStates();
        }
      } catch (error) {
        console.error('Error fetching data:', error);
        // Fallback to dummy data if request fails
        states.value = getDummyStates();
      }

    
    };

    const getDummyStates = () => {
        return [ ];
        };

    fetchData();

    const filteredStates = computed(() => {
      return states.value.filter(state => state.state.toLowerCase().includes(filterText.value.toLowerCase()));
    });

    const showStateDetails = async (state) => {
      if (!state.counties_obj) {
      const response = await axios.get(state.detail.replace(/nnn/g, '3000')); //assuming 3000 port for the sake of exercise
      if (response.data) {
       Object.assign(state, { counties_obj: response.data.counties });
       }
      }
      
      selectedState.value = state
    };

    const toggleHighlight = (state) => {
      state.highlighted = !state.highlighted;
    };

    return {
      selectedState,
      states,
      filterText,
      filteredStates,
      showStateDetails,
      toggleHighlight
    };
  }
};
</script>

<style scoped>
  #state-view {
        width: 1000px;
        margin: 0 auto;
    }
  .state-view-container {
  display: flex;
  flex-direction: row;
}

.list-container {
  margin-right: 20px;
}
</style>