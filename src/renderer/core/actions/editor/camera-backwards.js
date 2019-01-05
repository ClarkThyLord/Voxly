export default {
	name: 'camera backwards',
	category: 'editor',
	description: 'Moves the editor\'s camera backwards',
	hotkeys: 's',
	filter: true,
	action: function (e) {
		$("canvas").trigger("camera.move", [e]);
	}
}
