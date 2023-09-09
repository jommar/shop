<template>
  <div v-bind="attrs" class="bg-blue darken-3 mb-4 text-h5 px-4 py-2 rounded">
    <v-icon v-if="icon" start size="small">{{ icon }}</v-icon>
    <slot></slot>
  </div>
</template>
<script>
export default {
  props: {
    attrs: { type: Object },
    icon: { type: String },
  },
  setup() {},
}
</script>
