export default {
	name: 'camera left',
	category: 'editor',
	description: 'Moves the editor\'s camera left',
	hotkeys: 'a, left',
	action: function (e) {
		if (document.activeElement == $('canvas')[0]) $("canvas").trigger("camera.move", [e]);
	}
}
