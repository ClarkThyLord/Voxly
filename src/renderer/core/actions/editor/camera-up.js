export default {
	name: 'camera up',
	category: 'editor',
	description: 'Moves the editor\'s camera up',
	hotkeys: 'up',
	filter: true,
	action: function (e) {
		$("canvas").trigger("camera.move", [e]);
	}
}
