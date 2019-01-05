export default {
	name: 'camera right',
	category: 'editor',
	description: 'Moves the editor\'s camera right',
	hotkeys: 'd, right',
	filter: true,
	action: function (e) {
		$("canvas").trigger("camera.move", [e]);
	}
}
