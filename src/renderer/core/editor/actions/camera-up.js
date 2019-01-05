export default {
	name: 'camera up',
	category: 'editor',
	description: 'Moves the editor\'s camera up',
	hotkeys: 'up',
	action: function (e) {
		if (document.activeElement == $('canvas')[0]) $("canvas").trigger("camera.move", [e]);
	}
}
