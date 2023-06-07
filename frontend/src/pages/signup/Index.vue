<template>
  <q-page class="container-fluid">
    <div class="row">
      <q-scroll-area
        class="col-md col-sm-12 col-xs-12 flex flex-center"
        style="height: 100vh"
      >
        <q-toolbar class="text-light">
          <q-btn
            flat
            round
            dense
            icon="arrow_back_ios"
            class="q-mr-sm"
            color="light"
            to="/login"
          />
          <q-toolbar-title>Crear usuario</q-toolbar-title>
        </q-toolbar>

        <q-form @submit="onSubmit" class="q-pa-md q-gutter-sm">
          <span> Nombre </span>
          <q-input
            outlined
            v-model="name"
            placeholder="Introduce tu nombre(s)"
            lazy-rules
            clearable
            :rules="[(val) => (val && val.length > 0) || 'Campo Obligatorio']"
            :maxlength="100"
          >
          </q-input>

          <span> Apellido Paterno </span>
          <q-input
            outlined
            v-model="apat"
            placeholder="Introduce tu apellido"
            lazy-rules
            clearable
            :rules="[(val) => (val && val.length > 0) || 'Campo Obligatorio']"
            :maxlength="100"
          ></q-input>

          <span> Apellido Materno </span>
          <q-input
            outlined
            v-model="amat"
            placeholder="Introduce tu apellido"
            lazy-rules
            clearable
            :rules="[(val) => (val && val.length > 0) || 'Campo Obligatorio']"
            :maxlength="100"
          ></q-input>

          <span> Correo Electrónico </span>
          <q-input
            outlined
            v-model="email"
            label="email@ejemplo.com"
            lazy-rules
            :rules="[
              (val) => (val && val.length > 0) || 'Escribe tu correo',
              (val) =>
                (/@/.test(val) && /\./.test(val)) || 'El numero no es válido',
            ]"
          />

          <span> Número de Celular </span>
          <q-input
            outlined
            v-model="num"
            placeholder="Introduce tu número"
            lazy-rules
            clearable
            :rules="[
              (val) => (val && val.length > 0) || 'Campo Obligatorio',
              (val) =>
                /^[0-9]{10}$/.test(val) || 'El número de teléfono no es válido',
            ]"
            :maxlength="10"
          />

          <span> Contraseña </span>
          <q-input
            outlined
            v-model="pwd"
            placeholder="Introduce tu contraseña"
            lazy-rules
            :rules="[(val) => (val && val.length > 0) || 'Campo Obligatorio']"
            :type="isPwd ? 'password' : 'text'"
            :minlenght="8"
            :maxlength="100"
          >
            <template v-slot:append>
              <q-icon
                :name="isPwd ? 'visibility_off' : 'visibility'"
                class="cursor-pointer"
                @click="isPwd = !isPwd"
              >
              </q-icon>
            </template>
          </q-input>

          <span> Confirmar contraseña </span>
          <q-input
            outlined
            v-model="pwdcon"
            placeholder="Confirma tu contraseña"
            lazy-rules
            :rules="[
              (val) => (val && val.length > 0) || 'Campo Obligatorio',
              (val) => val == this.pwd || 'Las contraseñas no coinciden',
            ]"
            :type="isPwd ? 'password' : 'text'"
            :minlenght="8"
            :maxlength="100"
          >
          </q-input>

          <q-btn
            class="q-mt-md full-width"
            label="Crear"
            type="submit"
            color="primary"
            :loading="loading"
          />
        </q-form>
      </q-scroll-area>
      <div
        class="col-md col-sm-12 col-xs-12 flex flex-center cover-background desktop-only"
        style="height: 100vh"
      ></div>
    </div>
  </q-page>
</template>

<script>
export default {
  name: 'IndexSignup',
  data() {
    return {
      name: null,
      apat: null,
      amat: null,
      email: null,
      num: null,
      pwd: null,
      pwdcon: null,
      isPwd: true,

      loading: false,
    };
  },

  props: [],

  mounted() {},

  methods: {
    onSubmit() {
    },

    /*
    onSubmit() {
      this.loading = true;

      var data = {
        email: this.email.replace(/<[^>]*>?/gm, ""),
        nombre: this.name.replace(/<[^>]*>?/gm, ""),
        ap_pat: this.apat.replace(/<[^>]*>?/gm, ""),
        ap_mat: this.amat.replace(/<[^>]*>?/gm, ""),
        num_telefono: this.num.replace(/<[^>]*>?/gm, ""),
        password: this.pwd.replace(/<[^>]*>?/gm, ""),
        nivel: this.nivel.value.replace(/<[^>]*>?/gm, ""),
        objetivo: this.objetivo.value.replace(/<[^>]*>?/gm, ""),
        id_tipo: 1,
      };

      dataService
        .create("auth", "signup", data)
        .then((response) => {
          this.$q.notify({
            color: "positive",
            textColor: "white",
            icon: "done",
            message: "¡Te has registrado exitosamente!",
          });
          this.loading = false;
          this.$router.push(`/login`, () => {});
        })
        .catch((error) => {
          this.loading = false;
          this.$q.notify({
            color: "negative",
            textColor: "white",
            icon: "warning",
            message: "Ha ocurrido un error, inténtalo nuevamente",
          });
        });
    },
    */
  },
};
</script>

<style src="./style.css"></style>
