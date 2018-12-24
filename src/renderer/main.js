import Vue from 'vue'

import App from './App'

window.$ = require('jquery')

window.metro = require('metro4/build/js/metro.min.js')
import 'metro4/build/css/metro-all.min.css'
import 'metro4/build/css/schemes/darcula.min.css'

window.hotkeys = require('hotkeys-js').default

window.three = require('three/build/three.min.js')

window.actions = require('./core/actions.js').default

if (!process.env.IS_WEB) Vue.use(require('vue-electron'))
Vue.config.productionTip = false

window.vue = new Vue({
  components: { App },
  template: '<App/>',
	mounted: () => {
		window.metro.init()
	}
}).$mount('#app')
