<template>
  <div class="state-list">
    <FilterBox @filter-change="applyFilter" />
    <StateList :states="filteredStatesList" @state-click="handleClick" @state-dblclick="handleDoubleClick" />
  </div>
</template>

<script>
import { ref, computed, getCurrentInstance } from 'vue';
import FilterBox from './FilterBox.vue';
import StateList from './StateList.vue'; 

export default {
  props: {
    filteredStates: Array
  },
  components: {
    FilterBox,
    StateList
  },
  setup(props) {
    const filterText = ref('');
    const { emit } = getCurrentInstance();

    const applyFilter = (text) => {
      filterText.value = text;
    };

    const filteredStatesList = computed(() => {
      return props.filteredStates.filter(state => state.state.toLowerCase().includes(filterText.value.toLowerCase()));
    });

    const handleClick = (state) => {
      emit('state-click', state);
    };

    const handleDoubleClick = (state) => {
      emit('state-dblclick', state);
    };

    return {
      filteredStatesList,
      handleClick,
      handleDoubleClick,
      applyFilter
    };
  }
};
</script>
