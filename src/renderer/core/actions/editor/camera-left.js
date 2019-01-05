export default {
	name: 'camera left',
	category: 'editor',
	description: 'Moves the editor\'s camera left',
	hotkeys: 'a, left',
	filter: true,
	action: function (e) {
		$("canvas").trigger("camera.move", [e]);
	}
}
