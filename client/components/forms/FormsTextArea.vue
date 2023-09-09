<template>
  <div>
    <v-textarea v-bind="attributes" v-model="val" class="mb-4" />
  </div>
</template>
<script>
export default {
  name: 'TextArea',
  props: {
    attrs: { type: Object },
    modelValue: { type: null },
  },
  setup(props, context) {
    const val = ref(null)

    watch(
      () => val.value,
      (val) => {
        context.emit('update:modelValue', val)
      },
    )

    const attributes = computed(() => {
      const attrs = {
        'hide-details': 'auto',
        variant: 'outlined',
        clearable: true,
      }
      return {
        ...props.attrs,
        ...attrs,
      }
    })

    return { attributes, val }
  },
}
</script>
