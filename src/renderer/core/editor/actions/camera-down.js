export default {
	name: 'camera down',
	category: 'editor',
	description: 'Moves the editor\'s camera down',
	hotkeys: 'down',
	action: function (e) {
		if (document.activeElement == $('canvas')[0]) $("canvas").trigger("camera.move", [e]);
	}
}
