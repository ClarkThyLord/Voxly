export default {
	get,
	trigger,
	update,
	actions: [
		new action({
			name: 'action bar toggle',
			category: 'action bar',
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

	this.hotkeys = window.localStorage.getItem(`action.${this.name}`) || options.hotkeys || ''
	if (this.hotkeys != '') {
		this.trigger = (e, h) => {
			e.preventDefault()
			this.action()
		}
		window.hotkeys(this.hotkeys, this.trigger)
	}
}

function get(name) {
	return window._actions.actions.find((action) => {
		return action.name == name
	})
}

function trigger(name) {
	action = get(name)

	if (action) {
		action.action();

		return true;
	} else return false;
}

function update(name, hotkeys) {
	action = get(name)

	if (action) {
		window.hotkeys.unbind(action.hotkeys, action.trigger)

		action.hotkeys = hotkeys
		window.localStorage.setItem(`action.${action.name}`, action.hotkeys)
		window.hotkeys(action.hotkeys, action.trigger)

		return true;
	} else return false;
}
