<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <div>
      version: <strong>{{appVersion}}</strong>
    </div>
  </div>
</template>

<script>
export default {
  name: 'App',
  data () {
    return {
      appVersion: this.getVersion()
    }
  },
  methods: {
    getVersion() {
      console.log(process.env);
      if (process.env.NODE_ENV === 'development') return 'dev'
      return process.env.VUE_APP_VERSION || 'Не определена'
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
