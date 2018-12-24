<template>
	<div :style="{backgroundColor: backgroundColor || 'rgba(0,0,0,0.6)'}" class="loader">
		<div class="w-100 h-100 d-flex flex-column">
			<div style="flex: 1;"></div>

			<img :src="icon || require('@/../../static/voxly.svg')" :style="{width: iconWidth, height: iconHeight}" class="loader-icon ani-heartbeat" />

			<p class="loader-caption text-center">
				<i>
					{{ caption || 'Loading...' }}
				</i>
			</p>

			<div style="flex: 1;"></div>
		</div>
	</div>
</template>

<script>
	export default {
		name: 'loader',
		props: ['backgroundColor', 'icon', 'iconWidth', 'iconHeight', 'caption']
	}
</script>

<style scoped>
	.loader {
		width: 100%;
		height: 100%;
	}

	.loader .loader-icon {
	  display: block;
		margin: auto;
	}

	.loader .loader-caption {
    font-size: 16px;
    font-size: 2vw;
	}
</style>
