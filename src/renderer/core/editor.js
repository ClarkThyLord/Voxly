export default {
	init,
	update,
	resize
}

var scene, camera, renderer, cube;

function init() {
	scene = new window.three.Scene()
	camera = new window.three.PerspectiveCamera(75, 1, 0.1, 1000)

	renderer = new window.three.WebGLRenderer({canvas: window.$('#workspace canvas')[0], antialias: true})
	resize()

	let geometry = new window.three.BoxGeometry(1, 1, 1)
	let material = new window.three.MeshBasicMaterial({color: 0x00ff00})
 	cube = new window.three.Mesh(geometry, material)
	scene.add(cube)

	camera.position.z = 5

	window.addEventListener('resize', resize, false)

	update()
}

function update() {
	requestAnimationFrame(update)

	cube.rotation.x += 0.01
	cube.rotation.y += 0.01

	renderer.render(scene, camera)
}

function resize() {
	camera.aspect = window.innerWidth / window.innerHeight;
  camera.updateProjectionMatrix();

  renderer.setSize(window.innerWidth, window.innerHeight);
}
