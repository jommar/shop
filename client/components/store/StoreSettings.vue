<template>
  <div>
    <v-form>
      <FormsText
        :attrs="{ label: 'Name of the store' }"
        v-model="form.name"
      />
      <FormsText
        :attrs="{ label: 'Headline (optional)' }"
        v-model="form.headline"
      />
      <FormsSelect
        :attrs="{ label: 'Currency', items: currencies }"
        v-model="form.currency"
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
    })
    const currencies = computed(() => {
      return Object.values(curJson).map((i) => ({
        title: i.name,
        value: i.code,
      }))
    })

    return { form, currencies }
  },
}
</script>
