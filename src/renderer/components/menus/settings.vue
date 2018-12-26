<template>
	<div data-role="dialog" class="dialog w-75 h-75 d-flex flex-column" id="menu-settings">
		<div class="dialog-title mb-2">
			<h1>
				Settings
			</h1>
		</div>

		<div style="flex: 1;" class="dialog-content m-0 p-0 d-flex">
			<ul data-tabs-position="vertical h-100" data-role="tabs" style="flex: 0.33;" class="bg-dark bd-default">
		    <li title="General" class="bg-dark bg-gray-hover fg-white bd-default">
					<a href="#settings_general">
						<span class="mif-tools mif-2x"></span>
						<span class="d-none d-block-md"> General</span>
					</a>
				</li>
		    <li title="Actions" class="bg-dark bg-gray-hover fg-white bd-default">
					<a href="#settings_actions">
						<span class="mif-power mif-2x"></span>
						<span class="d-none d-block-md"> Actions</span>
					</a>
				</li>
		    <li title="Theming" class="bg-dark bg-gray-hover fg-white bd-default">
					<a href="#settings_theming">
						<span class="mif-widgets mif-2x"></span>
						<span class="d-none d-block-md"> Theming</span>
					</a>
				</li>
			</ul>

			<div style="flex: 1;" class="pt-2 pb-2 pl-5 pr-5 border border-left-none bd-default">
		    <div class="wh-100" id="settings_general">
					<h1 class="pb-2 d-none d-block-md text-normal border-bottom bd-default">
						<span class="mif-tools"></span> General
					</h1>

					<div class="w-100">
					</div>
		    </div>

		    <div class="w-100 h-100" id="settings_actions">
					<div class="w-100 h-100 d-flex flex-column">
						<h1 class="pb-2 d-none d-block-md text-normal border-bottom bd-default">
							<span class="mif-power"></span> Actions
						</h1>

						<actions style="flex: 1; overflow-y: auto;" class="m-3"></actions>
					</div>
		    </div>

		    <div class="wh-100" id="settings_theming">
					<h1 class="pb-2 d-none d-block-md text-normal border-bottom bd-default">
						<span class="mif-widgets"></span> Theming
					</h1>

					<div class="w-100">
					</div>
		    </div>
			</div>
		</div>

		<div class="dialog-actions mt-0 text-right">
			<button class="button js-dialog-close">Close</button>
			<button disabled class="button primary js-dialog-close">Save</button>
		</div>
	</div>
</template>

<script>
	import actions from '@/components/menus/settings/actions'

	export default {
		name: 'menu-settings',
		components: {
			actions
		}
	}
</script>

<style scoped>

</style>
