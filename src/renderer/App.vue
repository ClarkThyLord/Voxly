<template>
  <div id="app">
		<loader iconWidth="25%" id="main-loader"></loader>

		<menu-about></menu-about>
		<menu-settings></menu-settings>

		<div class="w-100 h-100 d-flex flex-column">
			<action-bar></action-bar>

			<div style="flex: 1;">
				<workspace style="position: absolute;" class="w-100 h-100"></workspace>
			</div>
		</div>
  </div>
</template>

<script>
	import loader from '@/components/loader'

	import MenuAbout from '@/components/menus/about'
	import MenuSettings from '@/components/menus/settings'

	import ActionBar from '@/components/action-bar/action-bar'
	import workspace from '@/components/workspace/workspace'

  export default {
    name: 'voxly',
    components: {
			loader,

			MenuAbout,
			MenuSettings,

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
