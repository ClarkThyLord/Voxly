export default {
	name: 'camera down',
	category: 'editor',
	description: 'Moves the editor\'s camera down',
	hotkeys: 'down',
	filter: true,
	action: function (e) {
		$("canvas").trigger("camera.move", [e]);
	}
}
