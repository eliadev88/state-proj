<template>
  <div class="state-list">
    <ul>
      <li v-for="state in states" :key="state.state" @click="handleClick(state)" @dblclick="handleDoubleClick(state)" :class="{ 'highlighted': state.highlighted }">
        {{ state.state }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  props: {
    states: Array
  },
  methods: {
    handleClick(state) {
      this.$emit('state-click', state);
    },
    handleDoubleClick(state) {
      this.$emit('state-dblclick', state);
    }
  }
};
</script>

<style scoped>
/* Add your styles here */
.state-list {
  flex: 1;
  margin-right: 20px;
}

.state-list h2 {
  margin-bottom: 10px;
}

.state-list {
  max-height: 100px; /* Adjust the maximum height as needed */
  overflow-y: auto;
}

.state-list ul {
  list-style-type: none;
  padding: 0;
}

.state-list li {
  cursor: pointer;
  padding: 5px;
}

.state-list li.highlighted {
  background-color: #f0f0f0;
}
</style>
