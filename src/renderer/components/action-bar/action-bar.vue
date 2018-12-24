<template>
	<nav data-role="ribbonmenu" id="action-bar">
		<!-- BRAND -->
    <ul class="tabs-holder">
      <li @click="toggle" class="static">
				<a class="c-pointer">
					<img src="@/../../static/voxly.svg" />
					<span class="d-none d-inline-md">Voxly</span>
				</a>
			</li>

			<!-- TABS -->
			<li>
				<a href="#action-bar-main">
					<span class="mif-home"></span>
					<span class="d-none d-inline-md">Main</span>
				</a>
			</li>
    </ul>

		<div class="content-holder">
      <div class="section" id="action-bar-main">

      </div>
    </div>
	</nav>
</template>

<script>
	export default {
		name: 'action-bar',
		methods: {
			toggle: () => {
				window.$('#action-bar .content-holder').toggle()
			}
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
