<template>
  <div>
    <v-form>
      <FormsText
        :attrs="{
          label: 'Niche',
          hint: 'This will be used by the AI to create categories',
          persistentHint: true,
        }"
        v-model="props.modelValue.niche.niche"
      />
      <FormsSelect
        :attrs="{
          label: 'Categories',
          multiple: true,
          items: categories,
          chips: true,
          closableChips: true,
        }"
        v-model="props.modelValue.niche.category"
      />
      <FormsTextArea
        :attrs="{
          label: 'The shop provides',
          hint: `Describe what kind of products you plan to offer in the store. For example, 'All about home products'. This information will be used by the AI to create categories.`,
          persistentHint: true,
        }"
        v-model="props.modelValue.niche.details"
      />
    </v-form>
  </div>
</template>
<script>
import categoriesJson from '@/static/shop-categories.json'
export default {
  name: 'StoreNiche',
  props: { modelValue: { type: Object } },
  setup(props) {
    const { $toSlug } = useNuxtApp()
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

    return { props, categories }
  },
}
</script>
