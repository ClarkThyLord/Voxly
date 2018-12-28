<template>
	<main class="bg-black" id="workspace">
		<canvas tabindex="1"></canvas>
	</main>
</template>

<script>
	export default {
		name: 'workspace',
		mounted: () => {
			window._editor.init()
		}
	}
</script>
