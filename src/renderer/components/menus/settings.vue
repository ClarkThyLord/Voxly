<template>
	<div data-role="dialog" class="dialog w-75 h-75 d-flex flex-column" id="menu-settings">
		<div class="dialog-title mb-2">
			<h1>
				Settings
			</h1>
		</div>

		<div style="flex: 1;" class="dialog-content m-0 p-0 d-flex">
			<ul data-role="tabs" data-tabs-position="vertical h-100" style="flex: 0.33;" class="bg-dark bd-default">
		    <li title="General" @click="tab = 'general'" class="fg-white bg-dark bg-gray-hover bd-default">
					<a href="#settings-general">
						<span class="mif-tools mif-2x"></span>
						<span class="d-none d-block-md"> General</span>
					</a>
				</li>
		    <li title="Actions" @click="tab = 'actions'" class="fg-white bg-dark bg-gray-hover bd-default">
					<a href="#settings-actions">
						<span class="mif-power mif-2x"></span>
						<span class="d-none d-block-md"> Actions</span>
					</a>
				</li>
		    <li title="Theming" @click="tab = 'theming'" class="fg-white bg-dark bg-gray-hover bd-default">
					<a href="#settings-theming">
						<span class="mif-widgets mif-2x"></span>
						<span class="d-none d-block-md"> Theming</span>
					</a>
				</li>
			</ul>

			<div style="flex: 1;" class="pt-2 pb-2 pl-5 pr-5 border border-left-none bd-default">
		    <div class="wh-100" id="settings-general">
					<h1 class="pb-2 d-none d-block-md text-normal border-bottom bd-default">
						<span class="mif-tools"></span> General
					</h1>

					<div class="w-100">
					</div>
		    </div>

		    <div class="w-100 h-100" id="settings-actions">
					<div class="w-100 h-100 d-flex flex-column">
						<h1 class="pb-2 d-none d-block-md text-normal border-bottom bd-default">
							<span class="mif-power"></span> Actions
						</h1>

						<actions ref="actions" style="flex: 1; overflow-x: hidden; overflow-y: auto;" class="m-3"></actions>
					</div>
		    </div>

		    <div class="wh-100" id="settings-theming">
					<h1 class="pb-2 d-none d-block-md text-normal border-bottom bd-default">
						<span class="mif-widgets"></span> Theming
					</h1>

					<div class="w-100">
					</div>
		    </div>
			</div>
		</div>

		<div class="dialog-actions mt-0 d-flex text-right">
			<div style="flex: 1;">
				<div v-if="this.tab == 'general'">
				</div>
				<div v-if="this.tab == 'actions'">
					<button @click="$refs.actions.resetAll()" class="button alert">Reset Hotkeys</button>
				</div>
				<div v-if="this.tab == 'theming'">
				</div>
			</div>

			<button class="button js-dialog-close">Close</button>
			<!-- <button disabled class="button primary js-dialog-close">Save</button> -->
		</div>
	</div>
</template>

<script>
	import actions from '@/components/menus/settings/actions'

	export default {
		name: 'menu-settings',
		data: function () {
			return {
				tab: 'general'
			}
		},
		components: {
			actions
		}
	}
</script>

<style scoped>
	.tabs > ul > li {
		border-top: none !important;
		border-left: none !important;
		border-bottom: none !important;
	}

	.tabs > ul > li.active > a {
		border-right: 2px solid white !important;
	}
</style>
