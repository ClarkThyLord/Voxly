<template>
	<nav data-role="ribbonmenu" data-on-tab="window._editor.resize()" id="action-bar">
    <ul class="tabs-holder">
      <li @click="toggle" class="static c-pointer">
				<a>
					<img src="@/../../static/voxly.svg" />
					<span class="d-none d-inline-md">Voxly</span>
				</a>
			</li>

			<li @click="visible">
				<a href="#action-bar-file">
					<span class="mif-file-empty"></span>
					<span class="d-none d-inline-md">File</span>
				</a>
			</li>

			<li @click="visible">
				<a href="#action-bar-editor">
					<span class="mif-pencil"></span>
					<span class="d-none d-inline-md">Editor</span>
				</a>
			</li>

			<li @click="visible">
				<a href="#action-bar-view">
					<span class="mif-widgets"></span>
					<span class="d-none d-inline-md">View</span>
				</a>
			</li>

			<li @click="visible">
				<a href="#action-bar-configuration">
					<span class="mif-cog"></span>
					<span class="d-none d-inline-md">Configuration</span>
				</a>
			</li>

			<span style="margin-left: auto;"></span>
			<li onclick="window._util.url_open('https://github.com/ClarkThyLord/Voxly')" title="Check us out on GitHub!" class="static c-pointer">
				<a>
					<span class="mif-github"></span>
					<span class="d-none d-inline-md">GitHub</span>
				</a>
			</li>

			<li onclick="window.metro.dialog.open('#menu-about')" class="static c-pointer">
				<a>
					<span class="mif-info"></span>
					<span class="d-none d-inline-md">About</span>
				</a>
			</li>

			<li onclick="window.metro.dialog.open('#menu-settings')" class="static c-pointer">
				<a>
					<span class="mif-cogs"></span>
					<span class="d-none d-inline-md">Settings</span>
				</a>
			</li>
    </ul>

		<div class="content-holder">
      <file></file>

			<editor></editor>

      <section-view></section-view>

      <configuration></configuration>
    </div>
	</nav>
</template>

<script>
	import file from './sections/file.vue'
	import editor from './sections/editor.vue'
	import SectionView from './sections/view.vue'
	import configuration from './sections/view.vue'

	export default {
		name: 'action-bar',
		components: {
			file,
			editor,
			SectionView,
			configuration
		},
		methods: {
			visible: () => {
				window.$('#action-bar .content-holder').show()
				window._editor.resize()
			},
			invisible: () => {
				window.$('#action-bar .content-holder').hide()
				window._editor.resize()
			},
			toggle: () => {
				window._actions.trigger('toggle')
				window._editor.resize()
			}
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
