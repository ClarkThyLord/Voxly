<template>
	<div>
		<div style="position: sticky; top: 0px;" class="m-3 mb-4 d-flex">
			<input type="text" placeholder="Search by name..." v-model="name" />
			<input type="text" placeholder="Search by category..." v-model="category" />
			<input type="text" placeholder="Search by hotkey(s)..." v-model="hotkeys" />
		</div>

		<table class="table table-border row-border row-hover">
	    <thead>
		    <tr>
	        <th>Name</th>
					<th>Category</th>
	        <th class="d-none d-block-md">Description</th>
	        <th>Hotkey(s)</th>
		    </tr>
	    </thead>

	    <tbody>
		    <tr v-for="action in _actions" class="c-pointer border-bottom border-dashed bd-white">
	        <td class="row-hover text-cap">{{ action.name }}</td>
	        <td class="row-hover text-cap">{{ action.category }}</td>
	        <td class="d-none d-block-md text-ellipsis">{{ action.description }}</td>
	        <td>{{ action.hotkeys }}</td>
		    </tr>
			</tbody>
		</table>
	</div>
</template>

<script>
	export default {
		name: 'actions',
		data: function () {
			return {
				name: '',
				category: '',
				hotkeys: '',
				actions: window._actions.actions
			}
		},
		computed: {
			_actions: function () {
				if (this.name == '' && this.category == '' && this.hotkeys == '') {
					return this.actions
				} else {
					return this.actions.filter((action) => {
						let valid = true
						if (this.name != '') valid = action.name.toLowerCase().indexOf(this.name.toLowerCase()) != -1;
						if (this.category != '') valid = action.category.toLowerCase().indexOf(this.category.toLowerCase()) != -1;
						if (this.hotkeys != '') valid = action.hotkeys.toLowerCase().indexOf(this.hotkeys.toLowerCase()) != -1;
						return valid
					})
				}
			}
		}
	}
</script>
