export default function (actions) {
	for (let action of [
		require('./action-bar/toggle.js').default
	]) {
		actions.load(action)
	}
}
