<template>
  <div>
    <v-form>
      <FormsText
        :attrs="{ label: 'Name of the store' }"
        v-model="props.modelValue.settings.name"
      />
      <FormsText
        :attrs="{ label: 'Headline (optional)' }"
        v-model="props.modelValue.settings.headline"
      />
      <FormsSelect
        :attrs="{ label: 'Currency', items: currencies }"
        v-model="props.modelValue.settings.currency"
      />
      <FormsSelect
        :attrs="{ label: 'Shop Type', items: types }"
        v-model="props.modelValue.settings.shopType"
      />
    </v-form>
  </div>
</template>
<script>
import curJson from '@/static/currencies.json'
export default {
  name: 'StoreSettings',
  props: { modelValue: { type: Object } },
  setup(props) {
    const currencies = computed(() => {
      return Object.values(curJson).map((i) => ({
        title: i.name,
        value: i.code,
      }))
    })
    const types = [{ title: 'Shopify', value: 'shopify' }]

    return { currencies, types, props }
  },
}
</script>
