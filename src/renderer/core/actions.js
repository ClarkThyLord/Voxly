export default {
	trigger,
	actions: [
		new action({
			name: 'action bar toggle',
			category: 'workspace',
			description: 'Toggles the view of the action bar',
			hotkeys: 'tab',
			action: function () {
				window.$('#action-bar .content-holder').toggle()
			}
		})
	]
}

function action(options) {
	this.name = options.name || 'action'
	this.category = options.category || 'misc'
	this.description = options.description || `This is a ${this.category} action`

	this.record = options.record || false

	this.action = options.action || function () {
		console.log(`- ACTION TRIGGERED -\nName: ${this.name}\nCategory: ${this.category}\nDescription: ${this.description}\n---`)
	}

	this.hotkeys = options.hotkeys || ''
	if (this.hotkeys != '') window.hotkeys(this.hotkeys, (e, h) => {
		e.preventDefault()
		this.action()
	});
}

function trigger(name) {
	let action = window._actions.actions.find((action) => {
		return action.name == name
	})

	if (action) {
		action.action();

		return true;
	} else return false;
}
