export default {
	name: 'remove',
	category: 'editor',
	description: 'Switch to the Remove tool in the Editor',
	hotkeys: '2',
	action: function (e) {
		window._editor.tool = 'remove'
	}
}
