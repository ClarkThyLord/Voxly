<template>
	<main class="bg-black" id="workspace">
		<div data-role="splitter" data-split-sizes="100, 0" class="w-100 h-100">
			<div data-role="splitter" data-split-sizes="100, 0" data-split-mode="vertical">
				<div id="editor-view-1">
					<canvas ref="view_1" style="position: absolute;" class="bg-black"></canvas>
				</div>

				<div id="editor-view-3">
					<canvas ref="view_3" style="position: absolute;" class="bg-black"></canvas>
				</div>
			</div>

			<div data-role="splitter" data-split-sizes="100, 0" data-split-mode="vertical">
				<div id="editor-view-2">
					<canvas ref="view_2" style="position: absolute;" class="bg-black"></canvas>
				</div>

				<div id="editor-view-4">
					<canvas ref="view_4" style="position: absolute;" class="bg-black"></canvas>
				</div>
			</div>
		</div>
	</main>
</template>

<script>
	export default {
		name: 'workspace',
		mounted: function () {
			window._editor.init([
				this.$refs.view_1,
				this.$refs.view_2,
				this.$refs.view_3,
				this.$refs.view_4
			])
		}
	}
</script>
