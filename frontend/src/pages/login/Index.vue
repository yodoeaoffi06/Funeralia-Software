<template>
  <q-page class="container-fluid q-pa-none">
    <div class="row">
      <div
        class="col-md col-sm-12 col-xs-12 flex flex-center"
        style="height: 100vh"
      >
        <q-form @submit="onSubmit">

          <h5>Inicio de sesión</h5>
          <q-input
            outlined
            v-model="email"
            label="Correo electrónico"
            hint="email@ejemplo.com"
            lazy-rules
            :rules="[
              (val) => (val && val.length > 0) || 'Escribe tu correo',
              (val) =>
                (/@/.test(val) && /\./.test(val)) || 'El numero no es válido',
            ]"
          />

          <q-input
            v-model="password"
            outlined
            :type="isPwd ? 'password' : 'text'"
            hint="Contraseña"
          >
            <template v-slot:append>
              <q-icon
                :name="isPwd ? 'visibility_off' : 'visibility'"
                class="cursor-pointer"
                @click="isPwd = !isPwd"
              />
            </template>
          </q-input>

          <q-btn
            class="q-mt-md full-width"
            label="Ingresar"
            type="submit"
            color="primary"
            :loading="loading"
          />
        </q-form>
      </div>

      <div
        class="col-md col-sm-12 col-xs-12 flex flex-center cover-background desktop-only"
        style="height: 100vh"
      ></div>
    </div>
  </q-page>
</template>

<script>
export default {
  name: 'IndexLogin',
  data() {
    return {
      email: null,
      password: null,
      isPwd: true,
      recovery: false,
      loading: false,
    };
  },

  props: [],

  methods: {
    onSubmit() {
      this.loading = true;

      var app = this;

      this.$auth.login( {
        data: {
          email: app.email.replace(/<[^>]*>?/gm, ""),
          password: app.password.replace(/<[^>]*>?/gm, ""),
        },
        success: function (res) {
          app.success = true;
        },
      })
      .then((res) => {})
      .catch((error) => {
        this.loading = false;
        console.log(error);
        this.$q.notify({
          color: "red-5",
          textColor: "white",
          icon: "warning",
          message: "Ha ocurrido un error"
        });
      });
    },
    /*
    onSubmit() {
      this.loading = true;
      var app = this;
      this.$auth
        .login({
          data: {
            email: app.email.replace(/<[^>]*>?/gm, ""),
            password: app.password.replace(/<[^>]*>?/gm, ""),
          },
          success: function (res) {
            app.success = true;
          },
        })
        .then((res) => {})
        .catch((error) => {
          this.loading = false;
          console.log(error);
          this.$q.notify({
            color: "red-5",
            textColor: "white",
            icon: "warning",
            message: "Ha ocurrido un error",
          });
        });
    },
    */
  },
};
</script>

<style src="./style.css"></style>
