<template>
  <div id="app">
		<loader iconWidth="25%" id="main-loader"></loader>

    <work-space></work-space>
  </div>
</template>

<script>
	import loader from '@/components/WorkSpace/loader'

  import WorkSpace from '@/components/WorkSpace'

  export default {
    name: 'voxly',
    components: {
			loader,

      WorkSpace
    }
  }
</script>

<style scoped>
	#main-loader {
		position: absolute;
	}
</style>
