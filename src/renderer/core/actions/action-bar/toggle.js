export default {
	name: 'toggle',
	category: 'action bar',
	description: 'Toggles the view of the action bar',
	hotkeys: 'tab',
	action: function () {
		window.$('#action-bar .content-holder').toggle()
		window._editor.resize()
	}
}
