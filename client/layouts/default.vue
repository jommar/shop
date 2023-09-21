<template>
  <v-layout class="rounded rounded-md">
    <LayoutsNavBar v-model="drawer" />
    <v-app-bar :title="title" class="bg-light-blue" elevation="0">
      <template v-slot:prepend>
        <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
      </template>
    </v-app-bar>
    <v-main>
      <div class="pa-4">
        <slot></slot>
      </div>
    </v-main>
  </v-layout>
</template>
<script>
export default {
  name: 'DefaultLayout',
  setup() {
    const drawer = ref(false)
    const title = ref('Smart Dropshipping')

    return { drawer, title }
  },
}
</script>
