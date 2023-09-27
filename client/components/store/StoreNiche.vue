<template>
  <div>
    <v-form>
      <FormsText
        :attrs="{
          label: 'Niche',
          hint: 'This will be used by the AI to create categories',
          persistentHint: true,
        }"
        v-model="form.niche"
      />
      <FormsSelect
        :attrs="{
          label: 'Categories',
          multiple: true,
          items: categories,
          chips: true,
          closableChips: true,
        }"
        v-model="form.category"
      />
      <FormsTextArea
        :attrs="{
          label: 'The shop provides',
          hint: `Describe what kind of products you plan to offer in the store. For example, 'All about home products'. This information will be used by the AI to create categories.`,
          persistentHint: true,
        }"
        v-model="form.details"
      />
    </v-form>
    <pre>{{ form }}</pre>
  </div>
</template>
<script>
import categoriesJson from '@/static/shop-categories.json'
export default {
  name: 'StoreNiche',
  setup() {
    const { $toSlug } = useNuxtApp()

    const form = ref({
      niche: '',
      category: [],
      details: '',
    })
    const categories = computed(() => {
      const categories = []
      categoriesJson.forEach((item) => {
        categories.push(
          ...item.subcategories.map((i) => ({
            title: `${item.name} - ${i.name}`,
            value: $toSlug(i.name),
            category: item.name,
          })),
        )
      })
      return categories
    })

    return { form, categories }
  },
}
</script>
