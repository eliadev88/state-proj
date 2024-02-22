<template>
  <input type="text" v-model="filterText" @input="filterStates" placeholder="Filter states..." />
</template>

<script>
import { ref } from 'vue';

export default {
  setup(props, { emit }) {
    const filterText = ref('');

    const filterStates = () => {
      emit('filter-change', filterText.value);
    };

    return {
      filterText,
      filterStates
    };
  }
};
</script>
