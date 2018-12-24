import Vue from 'vue'

import App from './App'

import $ from 'jquery'
window.$ = $

import metro from 'metro4/build/js/metro.min.js'
window.metro = metro
import 'metro4/build/css/metro-all.min.css'
import 'metro4/build/css/schemes/darcula.min.css'

import three from 'three/build/three.min.js'
window.three = three

if (!process.env.IS_WEB) Vue.use(require('vue-electron'))
Vue.config.productionTip = false

window.vue = new Vue({
  components: { App },
  template: '<App/>',
	mounted: () => {
		window.metro.init()
	}
}).$mount('#app')
