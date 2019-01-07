export default new actions()

function actions() {
	this.actions = []

	this.action = function (options) {
		this.name = options.name || 'action'
		this.category = options.category || 'misc'
		this.description = options.description || `This is a ${this.category} action`

		// TODO record in history
		this.record = options.record || false

		this.bind = options.bind == false ? false : true
		this.editable = options.editable || this.bind
		if (this.bind) {
			this.filter = options.filter || false

			this.action = options.action || function (e) {
				console.log(`- ACTION TRIGGERED -\nName: ${this.name}\nCategory: ${this.category}\nDescription: ${this.description}\n---`)
			}
		}

		this._hotkeys = options.hotkeys || ''
		this.hotkeys = window.localStorage.getItem(`action.${this.name}`) || this._hotkeys
		if (this.bind && this.hotkeys != '') {
			this.trigger = (e, h) => {
				if (this.filter && !this.filter()) return;

				e.preventDefault()
				this.action(e)
			}
			window.hotkeys(this.hotkeys, this.trigger)
		}

		this.represents = options.represents || undefined
	}

	this.load = (_action) => {
		this.actions.push(new this.action(_action))
	}

	this.loads = (_actions) => {
		for (let _action of _actions) {
			this.load(_action)
		}
	}

	this.get = (name) => {
		return this.actions.find((action) => {
			return action.name == name
		})
	}

	this.trigger = (name) => {
		let action = get(name)

		if (action) {
			action.action();

			return true;
		} else return false;
	}

	this.reset = (name) => {
		let action = get(name)

		action.hotkeys = action._hotkeys
		window.localStorage.setItem(`action.${action.name}`, action.hotkeys)
	}

	this.resets = () => {
		for (let action of this.actions) {
			action.hotkeys = action._hotkeys
			window.localStorage.setItem(`action.${action.name}`, action.hotkeys)
		}
	}

	this.update = (name, hotkeys) => {
		let action = get(name)

		if (action) {
			window.hotkeys.unbind(action.hotkeys, action.trigger)

			action.hotkeys = hotkeys
			window.localStorage.setItem(`action.${action.name}`, action.hotkeys)
			window.hotkeys(action.hotkeys, action.trigger)

			return true;
		} else return false;
	}

	require('./actions/action-bar.js').default(this);
	require('./actions/editor.js').default(this);
}
