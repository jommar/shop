<template>
  <div>
    <v-stepper :items="steps.items">
      <template #item="item">
        <v-card :title="item.title" flat>
          <StoreSettings v-if="item.value === 1" />
          <StoreSettings v-if="item.value === 2" />
          <StoreSettings v-if="item.value === 3" />
          <StoreSettings v-if="item.value === 4" />
          <StoreSettings v-if="item.value === 5" />
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
      items: ['Step 1', 'Step 2', 'Step 3', 'Step 4', 'Step 5'],
      content: [
        { component: 'StoreSettings' },
        { component: 'StoreNiche' },
        { component: 'ContactInfo' },
        { component: 'PaymentInfo' },
        { component: 'BuildStore' },
      ],
    }

    return { steps }
  },
}
</script>
