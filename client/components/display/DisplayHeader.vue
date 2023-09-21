<template>
  <div v-bind="attrs" class="bg-light-blue-lighten-5 rounded text-h4 px-4 py-2">
    <v-icon v-if="useIcon" start size="small" class="mr-8">{{ useIcon }}</v-icon>
    <slot></slot>
  </div>
</template>
<script>
export default {
  props: {
    attrs: { type: Object },
    icon: { type: String },
  },
  setup(props) {
    const useIcon = computed(() => {
      return props.attrs.icon || props.icon || null
    })

    return { useIcon }
  },
}
</script>
