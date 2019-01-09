<template>
	<main class="bg-black" id="workspace">
		<div data-role="splitter" data-split-sizes="100, 0" class="w-100 h-100">
			<div data-role="splitter" data-split-sizes="100, 0" data-split-mode="vertical">
				<div id="editor-view-1">
					<div style="position: absolute; background-color: rgba(0, 0, 0, 0.6);" class="w-100 h-100 d-flex flex-justify-center flex-align-center c-pointer">
						<h5>View #1</h5>
					</div>

					<canvas ref="view_1" style="position: absolute;" class="bg-black"></canvas>
				</div>

				<div id="editor-view-3">
					<div style="position: absolute; background-color: rgba(0, 0, 0, 0.6);" class="w-100 h-100 d-flex flex-justify-center flex-align-center c-pointer">
						<h5>View #3</h5>
					</div>

					<canvas ref="view_3" style="position: absolute;" class="bg-black"></canvas>
				</div>
			</div>

			<div data-role="splitter" data-split-sizes="100, 0" data-split-mode="vertical">
				<div id="editor-view-2">
					<div style="position: absolute; background-color: rgba(0, 0, 0, 0.6);" class="w-100 h-100 d-flex flex-justify-center flex-align-center c-pointer">
						<h5>View #2</h5>
					</div>

					<canvas ref="view_2" style="position: absolute;" class="bg-black"></canvas>
				</div>

				<div id="editor-view-4">
					<div style="position: absolute; background-color: rgba(0, 0, 0, 0.6);" class="w-100 h-100 d-flex flex-justify-center flex-align-center c-pointer">
						<h5>View #4</h5>
					</div>

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
