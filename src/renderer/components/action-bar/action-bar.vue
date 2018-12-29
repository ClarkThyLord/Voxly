<template>
	<nav data-role="ribbonmenu" id="action-bar">
    <ul class="tabs-holder">
      <li @click="toggle" class="static c-pointer">
				<a>
					<img src="@/../../static/voxly.svg" />
					<span class="d-none d-inline-md">Voxly</span>
				</a>
			</li>

			<li @click="visible">
				<a href="#action-bar-files">
					<span class="mif-file-empty"></span>
					<span class="d-none d-inline-md">Files</span>
				</a>
			</li>

			<li @click="visible">
				<a href="#action-bar-main">
					<span class="mif-home"></span>
					<span class="d-none d-inline-md">Main</span>
				</a>
			</li>

			<span style="margin-left: auto;"></span>
			<li @click="github" title="Check us out on GitHub!" class="static c-pointer">
				<a>
					<span class="mif-github"></span>
					<span class="d-none d-inline-md">GitHub</span>
				</a>
			</li>
			<li @click="about_menu" class="static c-pointer">
				<a>
					<span class="mif-info"></span>
					<span class="d-none d-inline-md">About</span>
				</a>
			</li>
			<li @click="settings_menu" class="static c-pointer">
				<a>
					<span class="mif-cogs"></span>
					<span class="d-none d-inline-md">Settings</span>
				</a>
			</li>
    </ul>

		<div class="content-holder">
      <div class="section" id="action-bar-files">

      </div>

      <div class="section" id="action-bar-main">

      </div>
    </div>
	</nav>
</template>

<script>
	export default {
		name: 'action-bar',
		methods: {
			visible: () => {
				window.$('#action-bar .content-holder').show()
			},
			invisible: () => {
				window.$('#action-bar .content-holder').hide()
			},
			toggle: () => {
				window._actions.trigger('action bar toggle')
			},
			about_menu: () => {
				window.metro.dialog.open('#menu-about')
			},
			github: () => {
				window._util.url_open('https://github.com/ClarkThyLord/Voxly')
			},
			settings_menu: () => {
				window.metro.dialog.open('#menu-settings')
			}
		},
		mounted: () => {
			window._actions.load([
				{
					name: 'action bar toggle',
					category: 'action bar',
					description: 'Toggles the view of the action bar',
					hotkeys: 'tab',
					action: function () {
						window.$('#action-bar .content-holder').toggle()
					}
				}
			])
		}
	}
</script>

<style scoped>
	#action-bar .tabs-holder {
		border-bottom: none;
	}

	#action-bar .tabs-holder li img {
		width: 16px;
	}
</style>
