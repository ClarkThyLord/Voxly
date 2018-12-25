<template>
	<div data-role="dialog" data-overlay-click-close="true" class="dialog" id="menu-about">
		<div style="overflow-x: none; overflow-y: auto;" class="dialog-content text-center">
			<img src="@/../../static/voxly.svg" style="width: 75%;" />
			<h3>Voxly</h3>

			<hr class="m-2" />

			<p class="p-4">
				<i>
					Intuitive open source voxel editor;
					<br />
					for both small and big ideas!
				</i>
			</p>
		</div>

		<div class="dialog-actions text-right">
			<button class="button js-dialog-close">Close</button>
		</div>
	</div>
</template>

<script>
	export default {
		name: 'menu-about'
	}
</script>
