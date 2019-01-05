export default new actions()

function actions() {
	this.actions = []

	this.load = (_action) => {
		window._actions.load(_action)
	}

	this.loads = (_actions) => {
		for (let _action of _actions) {
			this.load(_action)
		}
	}

	this.loads([
		require('./actions/action.js').default,
		require('./actions/camera-rotation.js').default,
		require('./actions/camera-pan.js').default,
		require('./actions/camera-zoom-+.js').default,
		require('./actions/camera-zoom--.js').default,
		require('./actions/camera-foward.js').default,
		require('./actions/camera-backwards.js').default,
		require('./actions/camera-up.js').default,
		require('./actions/camera-right.js').default,
		require('./actions/camera-down.js').default,
		require('./actions/camera-left.js').default,
	])
}
