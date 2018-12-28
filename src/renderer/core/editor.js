import CameraControls from './editor/camera-controls.js'

export default {
	init,
	update,
	resize
}

var scene, camera, clock, renderer, ligth, cube

function init() {
	scene = new window.three.Scene()

	ligth = new window.three.AmbientLight(0x606060);
	scene.add(ligth);

	camera = new window.three.PerspectiveCamera(75, 1, 0.1, 1000)

	clock = new window.three.Clock()

	renderer = new window.three.WebGLRenderer({
		canvas: window.$('#workspace canvas')[0],
		antialias: true
	})
	resize()

	window.addEventListener('resize', resize, false)

	camera.controls = new CameraControls(camera, renderer.domElement)

	let geometry = new window.three.BoxGeometry(1, 1, 1)
	let material = new window.three.MeshBasicMaterial({color: 0x00ff00})
 	cube = new window.three.Mesh(geometry, material)
	scene.add(cube)

	camera.position.z = 5

	window._actions.load([
		{
			name: 'camera foward',
			category: 'editor',
			description: 'Moves the editor\'s camera foward',
			hotkeys: 'w',
			action: function (e) {
				if (document.activeElement == $('canvas')[0]) $("canvas").trigger("camera.move", [e]);
			}
		},
		{
			name: 'camera backwards',
			category: 'editor',
			description: 'Moves the editor\'s camera backwards',
			hotkeys: 's',
			action: function (e) {
				if (document.activeElement == $('canvas')[0]) $("canvas").trigger("camera.move", [e]);
			}
		},
		{
			name: 'camera up',
			category: 'editor',
			description: 'Moves the editor\'s camera up',
			hotkeys: 'up',
			action: function (e) {
				if (document.activeElement == $('canvas')[0]) $("canvas").trigger("camera.move", [e]);
			}
		},
		{
			name: 'camera right',
			category: 'editor',
			description: 'Moves the editor\'s camera right',
			hotkeys: 'd, right',
			action: function (e) {
				if (document.activeElement == $('canvas')[0]) $("canvas").trigger("camera.move", [e]);
			}
		},
		{
			name: 'camera down',
			category: 'editor',
			description: 'Moves the editor\'s camera down',
			hotkeys: 'down',
			action: function (e) {
				if (document.activeElement == $('canvas')[0]) $("canvas").trigger("camera.move", [e]);
			}
		},
		{
			name: 'camera left',
			category: 'editor',
			description: 'Moves the editor\'s camera left',
			hotkeys: 'a, left',
			action: function (e) {
				if (document.activeElement == $('canvas')[0]) $("canvas").trigger("camera.move", [e]);
			}
		}
	])

	update()
}

function resize() {
	camera.aspect = window.innerWidth / window.innerHeight
  camera.updateProjectionMatrix()

  renderer.setSize(window.innerWidth, window.innerHeight)
}

function update() {
	requestAnimationFrame(update)

	let delta = clock.getDelta()

	camera.controls.update(delta)

	cube.rotation.x += 0.01
	cube.rotation.y += 0.01

	renderer.render(scene, camera)
}
