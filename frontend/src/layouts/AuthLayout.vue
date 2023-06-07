<template>
    <q-layout view="lHh Lpr lFf">
      <q-page-container>
        <router-view />
      </q-page-container>
    </q-layout>
  </template>

  <script>

  export default {
    name: 'AuthLayout',
    components: {  },
    data () {
      return {

      }
    },
    created() {
      //console.log(this.$auth.user(),'auth',this.$route.meta,'meta');
    },
  }
  </script>
