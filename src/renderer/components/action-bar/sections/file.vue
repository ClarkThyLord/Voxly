<template>
	<div class="section" id="action-bar-file">
		<div class="group">
			<span class="title fg-black">File Options</span>

			<button title="New file..." class="ribbon-button">
				<span class="icon">
					<span class="mif-file-empty"></span>
				</span>
				<span class="caption d-none d-block-md">New file...</span>
			</button>
			<button title="Save file..." class="ribbon-button">
				<span class="icon">
					<span class="mif-file-download"></span>
				</span>
				<span class="caption d-none d-block-md">Save file...</span>
			</button>
			<button title="Save file as..." class="ribbon-button">
				<span class="icon">
					<span class="mif-download2"></span>
				</span>
				<span class="caption d-none d-block-md">Save file as...</span>
			</button>
			<button title="Open file..." class="ribbon-button">
				<span class="icon">
					<span class="mif-folder-open"></span>
				</span>
				<span class="caption d-none d-block-md">Open file...</span>
			</button>
		</div>

		<div style="flex: 1;" class="group">
			<span class="title fg-black">Recent Files</span>

			<div style="flex: 1;" class="d-flex">
				<button class="ribbon-button">
					<span class="icon">
						<span class="mif-chevron-thin-left"></span>
					</span>
				</button>

				<div style="flex: 1;" class="m-1">
					<div data-role="tile" data-size="small" class="bg-gray"></div>
				</div>

				<button class="ribbon-button">
					<span class="icon">
						<span class="mif-chevron-thin-right"></span>
					</span>
				</button>
			</div>
		</div>
	</div>
</template>

<script>
	export default {
		name: 'file'
	}
</script>
