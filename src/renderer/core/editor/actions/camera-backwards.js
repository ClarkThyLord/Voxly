export default {
	name: 'camera backwards',
	category: 'editor',
	description: 'Moves the editor\'s camera backwards',
	hotkeys: 's',
	action: function (e) {
		if (document.activeElement == $('canvas')[0]) $("canvas").trigger("camera.move", [e]);
	}
}
