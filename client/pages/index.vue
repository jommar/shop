<template>
  <div>
    <v-stepper :items="steps.items">
      <template #item="item">
        <v-card flat>
          <DisplayHeader :attrs="{ icon: item.raw.icon }">
            {{ item.title }}
          </DisplayHeader>
          <v-card-text>
            <StoreSettings v-if="item.value === 1" />
            <StoreNiche v-else-if="item.value === 2" />
            <StoreContact v-else-if="item.value === 3" />
          </v-card-text>
        </v-card>
      </template>
    </v-stepper>
  </div>
</template>
<script>
export default {
  name: 'IndexPage',
  setup() {
    const steps = {
      items: [
        { title: 'Store Settings', value: 1, icon: 'mdi-cogs' },
        { title: 'Niche', value: 2, icon: 'mdi-tag' },
        { title: 'Contact Info', value: 3, icon: 'mdi-card-account-mail' },
        { title: 'Payment', value: 4, icon: 'mdi-credit-card' },
        { title: 'Build', value: 5, icon: 'mdi-wrench' },
      ],
    }

    return { steps }
  },
}
</script>
