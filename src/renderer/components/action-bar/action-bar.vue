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
				<div class="group">
					<span class="title fg-black">File Options</span>

					<button title="New file..." class="ribbon-button">
						<span class="icon">
							<span class="mif-file-empty"></span>
						</span>
						<span class="caption d-none d-block-md">New file...</span>
					</button>
					<button title="Save file..." class="ribbon-button">
						<span class="icon">
							<span class="mif-file-download"></span>
						</span>
						<span class="caption d-none d-block-md">Save file...</span>
					</button>
					<button title="Save file as..." class="ribbon-button">
						<span class="icon">
							<span class="mif-download2"></span>
						</span>
						<span class="caption d-none d-block-md">Save file as...</span>
					</button>
					<button title="Open file..." class="ribbon-button">
						<span class="icon">
							<span class="mif-folder-open"></span>
						</span>
						<span class="caption d-none d-block-md">Open file...</span>
					</button>
				</div>

				<div style="flex: 1;" class="group">
					<span class="title fg-black">Recent Files</span>

					<div style="flex: 1;" class="d-flex">
						<button class="ribbon-button">
							<span class="icon">
								<span class="mif-chevron-thin-left"></span>
							</span>
						</button>

						<div style="flex: 1;" class="m-1">
							<div data-role="tile" data-size="small" class="bg-gray"></div>
						</div>

						<button class="ribbon-button">
							<span class="icon">
								<span class="mif-chevron-thin-right"></span>
							</span>
						</button>
					</div>
				</div>
      </div>

      <div class="section" id="action-bar-main">

      </div>

      <div class="section" id="action-bar-view">

      </div>

      <div class="section" id="action-bar-configuration">

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
