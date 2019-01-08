export default {
	name: 'add',
	category: 'editor',
	description: 'Switch to the Add tool in the Editor',
	hotkeys: '1',
	action: function (e) {
		window._editor.tool = 'add'
	}
}
