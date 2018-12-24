<template>
  <div class="d-flex flex-column" id="app">
		<loader iconWidth="25%" id="main-loader"></loader>

		<action-bar></action-bar>

		<workspace style="flex: 1;"></workspace>
  </div>
</template>

<script>
	import loader from '@/components/loader'

	import ActionBar from '@/components/action-bar/action-bar'
	import workspace from '@/components/workspace/workspace'

  export default {
    name: 'voxly',
    components: {
			loader,

			ActionBar,
			workspace
    },
		mounted: () => {
			window.$('#main-loader').hide()
		}
  }
</script>

<style scoped>
	#main-loader {
		z-index: 10000;
		position: absolute;
	}
</style>
