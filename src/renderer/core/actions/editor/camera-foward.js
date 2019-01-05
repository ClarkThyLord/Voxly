export default {
	name: 'camera foward',
	category: 'editor',
	description: 'Moves the editor\'s camera foward',
	hotkeys: 'w',
	filter: true,
	action: function (e) {
		$("canvas").trigger("camera.move", [e]);
	}
}
