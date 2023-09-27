<template>
  <div>
    <v-form>
      <FormsText :attrs="{ label: 'Name of the store' }" v-model="form.name" />
      <FormsText
        :attrs="{ label: 'Headline (optional)' }"
        v-model="form.headline"
      />
      <FormsSelect
        :attrs="{ label: 'Currency', items: currencies }"
        v-model="form.currency"
      />
      <FormsSelect
        :attrs="{ label: 'Shop Type', items: types }"
        v-model="form.shopType"
      />
    </v-form>
    <pre>{{ form }}</pre>
  </div>
</template>
<script>
import curJson from '@/static/currencies.json'
export default {
  name: 'StoreSettings',
  setup() {
    const form = ref({
      name: '',
      headline: '',
      currency: '',
      shopType: '',
    })
    const currencies = computed(() => {
      return Object.values(curJson).map((i) => ({
        title: i.name,
        value: i.code,
      }))
    })
    const types = [{ title: 'Shopify', value: 'shopify' }]

    return { form, currencies, types }
  },
}
</script>
