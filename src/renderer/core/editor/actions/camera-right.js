export default {
	name: 'camera right',
	category: 'editor',
	description: 'Moves the editor\'s camera right',
	hotkeys: 'd, right',
	action: function (e) {
		if (document.activeElement == $('canvas')[0]) $("canvas").trigger("camera.move", [e]);
	}
}
