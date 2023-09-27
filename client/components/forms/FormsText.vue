<template>
  <div>
    <v-text-field
      v-if="attrs.type === 'password'"
      v-bind="attributes"
      v-model="val"
      class="mb-4"
      :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
      @click:append="showPassword = !showPassword"
    />
    <v-text-field v-else v-bind="attributes" v-model="val" class="mb-4" />
  </div>
</template>
<script>
export default {
  name: 'TextField',
  props: {
    attrs: { type: Object },
    modelValue: { type: null },
  },
  setup(props, context) {
    const val = ref(null)
    const showPassword = ref(false)

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
      const attributes = {
        ...props.attrs,
        ...attrs,
      }
      if (props.attrs.type === 'password') {
        attributes.type = showPassword.value ? 'text' : 'password'
      }

      return attributes
    })

    return { attributes, val, showPassword }
  },
}
</script>
