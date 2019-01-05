<template>
	<div>
		<div data-role="dialog" class="dialog" id="menu-settings-actions-modify">
	    <div class="dialog-title">
				Change hotkey(s) for <span class="text-cap">{{ action.name || 'Action' }}</span>
			</div>

		  <div class="dialog-content">
				<input type="text" v-model="temp_hotkeys" />
	    </div>

		  <div class="dialog-actions">
        <button class="button js-dialog-close">Cancel</button>
        <button v-if="temp_reset" @click="reset" class="button alert js-dialog-close">Reset</button>
        <button :disabled="!(this.temp_hotkeys.length > 0)" @click="update" class="button primary js-dialog-close">Confirm</button>
	    </div>
		</div>

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
		    <tr v-for="action in _actions" @click="modify(action)" class="border-bottom border-dashed bd-white" :class="{'c-pointer': action.editable, 'c-default': !action.editable}">
	        <td class="text-cap">{{ action.name }}</td>
	        <td class="text-cap">{{ action.category }}</td>
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

				temp_reset: false,
				temp_hotkeys: '',

				action: {},
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
		},
		methods: {
			modify: function (action) {
				if (!action.editable) return;

				this.action = action
				this.temp_reset = window.localStorage.getItem(`action.${this.action.name}`) && window.localStorage.getItem(`action.${this.action.name}`) != this.action._hotkeys ? true : false
				this.temp_hotkeys = this.action.hotkeys
				window.metro.dialog.open('#menu-settings-actions-modify')
			},
			reset: function () {
				window._actions.reset(this.action.name)
			},
			resets: function () {
				window._actions.resets()
			},
			update: function () {
				if (window._actions.update(this.action.name, this.temp_hotkeys)) {
	        window.metro.notify.create(`<b class="text-cap">${this.action.name}</b> hotkey(s) successfully updated!`, "Action Hotkeys", {
            cls: "success",
						timeout: 5000
	        })
				} else {
	        window.metro.notify.create(`<b class="text-cap">${this.action.name}</b> hotkey(s) unsuccessfully updated...`, "Action Hotkeys", {
            cls: "alert",
						timeout: 7000
	        })
				}
			}
		}
	}
</script>
