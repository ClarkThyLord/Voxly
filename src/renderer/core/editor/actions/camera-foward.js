export default {
	name: 'camera foward',
	category: 'editor',
	description: 'Moves the editor\'s camera foward',
	hotkeys: 'w',
	action: function (e) {
		if (document.activeElement == $('canvas')[0]) $("canvas").trigger("camera.move", [e]);
	}
}
