<template>
  <div>
    <v-form>
      <FormsText
        :attrs="{
          label: 'Email',
        }"
        v-model="form.email"
      />
      <div class="d-flex">
        <FormsSelect
          style="width: 150px;"
          class="mr-8"
          :attrs="{
            label: 'Phone',
            items: phoneCodes,
          }"
          v-model="form.phone.code"
        />
        <FormsText
          class="flex-grow-1"
          :attrs="{
            label: 'Phone',
          }"
          v-model="form.phone.number"
        />
      </div>
      <FormsSelect
        :attrs="{
          label: 'Country',
          items: countries,
        }"
        v-model="form.country"
      />
    </v-form>
    <pre>{{ form }}</pre>
  </div>
</template>
<script>
import countriesJson from '@/static/countries.json'
export default {
  name: 'StoreContact',
  setup() {
    const form = ref({
      email: '',
      phone: {
        code: '',
        number: '',
      },
      country: '',
    })
    const countries = computed(() => {
      return Object.values(countriesJson).map((i) => ({
        title: i.name,
        value: i.code,
      }))
    })
    const phoneCodes = computed(() => {
      return Object.values(countriesJson).map((i) => ({
        title: i.dial_code,
        value: i.dial_code,
      }))
    })

    return { form, countries, phoneCodes }
  },
}
</script>
