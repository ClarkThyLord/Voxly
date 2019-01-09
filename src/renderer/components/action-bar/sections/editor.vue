<template>
	<div class="section" id="action-bar-editor">
		<div class="group">
			<span class="title fg-black">Tools</span>

			<button onclick="window._editor.tool = 'add'" class="ribbon-button">
				<span class="icon">
					<img src="../icons/add.svg" />
				</span>
				<span class="caption">Add</span>
			</button>

			<button onclick="window._editor.tool = 'remove'" class="ribbon-button">
				<span class="icon">
					<img src="../icons/subtract.svg">
				</span>
				<span class="caption">Subtract</span>
			</button>

			<button class="ribbon-button">
				<span class="icon">
					<img src="../icons/paint.svg">
				</span>
				<span class="caption">Paint</span>
			</button>

			<button class="ribbon-button">
				<span class="icon">
					<img src="../icons/select.svg">
				</span>
				<span class="caption">Select</span>
			</button>

			<button class="ribbon-button">
				<span class="icon">
					<img src="../icons/translate.svg">
				</span>
				<span class="caption">Transform</span>
			</button>
		</div>

		<div style="flex: 1;" class="group">
			<span class="title fg-black">About</span>
		</div>
	</div>
</template>

<script>
	export default {
		name: 'editor'
	}
</script>
