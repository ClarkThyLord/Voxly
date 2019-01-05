export default function (actions) {
	for (let action of [
		require('./editor/camera-rotation.js').default,
		require('./editor/camera-pan.js').default,
		require('./editor/camera-zoom-+.js').default,
		require('./editor/camera-zoom--.js').default,
		require('./editor/camera-foward.js').default,
		require('./editor/camera-backwards.js').default,
		require('./editor/camera-up.js').default,
		require('./editor/camera-right.js').default,
		require('./editor/camera-down.js').default,
		require('./editor/camera-left.js').default
	]) {
		if (action.filter) typeof action.filter == 'function' ? true : action.filter = function () {
			return (document.activeElement == $('canvas')[0])
		}

		actions.load(action)
	}
}
