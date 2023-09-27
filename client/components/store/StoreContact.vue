<template>
  <div>
    <v-form>
      <FormsText
        :attrs="{
          label: 'Email',
        }"
        v-model="props.modelValue.contact.email"
      />
      <div class="d-flex">
        <FormsSelect
          style="width: 150px;"
          class="mr-8"
          :attrs="{
            label: 'Phone',
            items: phoneCodes,
          }"
          v-model="props.modelValue.contact.phone.code"
        />
        <FormsText
          class="flex-grow-1"
          :attrs="{
            label: 'Phone',
          }"
          v-model="props.modelValue.contact.phone.number"
        />
      </div>
      <FormsSelect
        :attrs="{
          label: 'Country',
          items: countries,
        }"
        v-model="props.modelValue.contact.country"
      />
      <FormsText
        class="flex-grow-1"
        :attrs="{
          label: 'Password',
          type: 'password',
        }"
        v-model="props.modelValue.contact.password"
      />
    </v-form>
  </div>
</template>
<script>
import countriesJson from '@/static/countries.json'
export default {
  name: 'StoreContact',
  props: { modelValue: { type: Object } },
  setup(props) {
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

    return { countries, phoneCodes, props }
  },
}
</script>
