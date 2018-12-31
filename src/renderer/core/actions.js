export default {
	load,
	get,
	trigger,
	reset,
	resetAll,
	update,
	action,
	actions: []
}

function action(options) {
	this.name = options.name || 'action'
	this.category = options.category || 'misc'
	this.description = options.description || `This is a ${this.category} action`

	// TODO record in history
	this.record = options.record || false

	this.bind = options.bind == false ? false : true
	this.editable = options.editable || this.bind
	if (this.bind) {
		this.action = options.action || function (e) {
			console.log(`- ACTION TRIGGERED -\nName: ${this.name}\nCategory: ${this.category}\nDescription: ${this.description}\n---`)
		}
	}

	this._hotkeys = options.hotkeys || ''
	this.hotkeys = window.localStorage.getItem(`action.${this.name}`) || this._hotkeys
	if (this.bind && this.hotkeys != '') {
		this.trigger = (e, h) => {
			e.preventDefault()
			this.action(e)
		}
		window.hotkeys(this.hotkeys, this.trigger)
	}
}

function load(actions) {
	for (action of actions) {
		window._actions.actions.push(new window._actions.action(action))
	}
}

function get(name) {
	return window._actions.actions.find((action) => {
		return action.name == name
	})
}

function trigger(name) {
	let action = get(name)

	if (action) {
		action.action();

		return true;
	} else return false;
}

function reset(name) {
	let action = get(name)
	action.hotkeys = action._hotkeys
	window.localStorage.setItem(`action.${action.name}`, action.hotkeys)
}

function resetAll() {
	for (let action of window._actions.actions) {
		action.hotkeys = action._hotkeys
		window.localStorage.setItem(`action.${action.name}`, action.hotkeys)
	}
}

function update(name, hotkeys) {
	let action = get(name)

	if (action) {
		window.hotkeys.unbind(action.hotkeys, action.trigger)

		action.hotkeys = hotkeys
		window.localStorage.setItem(`action.${action.name}`, action.hotkeys)
		window.hotkeys(action.hotkeys, action.trigger)

		return true;
	} else return false;
}
