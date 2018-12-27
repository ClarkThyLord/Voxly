<template>
	<div data-role="dialog" data-overlay-click-close="true" class="dialog" id="menu-about">
		<div style="overflow-x: none; overflow-y: auto;" class="dialog-content text-center">
			<img src="@/../../static/voxly.svg" style="width: 75%;" />
			<h3 class="text-cap">
				{{ package.name }}
				<h5>
					<small>
						<i>
							v{{ package.version }}
						</i>
					</small>
				</h5>
			</h3>

			<hr class="m-2" />

			<p class="p-4">
				<b>
					Licensed:
					{{ package.license }}
				</b>
				<br />
				<i>
					{{ package.description }}
				</i>
			</p>

			<div class="m-2">
				<h5>
					Dependencies
				</h5>

				<ul class="dependencies">
					<li v-for="(version, name) in package.dependencies" data-role="hint" :data-hint-text="version" data-cls-hint="text-center" class="dependency text-cap">
						{{ name }}
					</li>
				</ul>
			</div>
		</div>

		<div class="dialog-actions text-right">
			<button class="button js-dialog-close">Close</button>
		</div>
	</div>
</template>

<script>
	export default {
		name: 'menu-about',
		data: () => {
			return {
				package: window._package
			}
		}
	}
</script>

<style scoped>
	.dependency {
		 margin: 3px;
		 padding: 2px;
		 display: inline-block;
	}
</style>
