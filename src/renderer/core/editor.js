import CameraControls from './editor/camera-controls.js'

export default new editor()

function editor() {
	this.init = () => {
		this.actions = require('./editor/actions.js').default

		this.scene = new window.three.Scene()

		let ligth = new window.three.AmbientLight(0x606060);
		this.scene.add(ligth);

		this.camera = new window.three.PerspectiveCamera(75, 1, 0.1, 1000)

		this.clock = new window.three.Clock()

		this.renderer = new window.three.WebGLRenderer({
			canvas: window.$('#workspace canvas')[0],
			antialias: true
		})
		this.resize()

		window.addEventListener('resize', this.resize, false)

		this.camera.controls = new CameraControls(this.camera, this.renderer.domElement)

		let geometry = new window.three.BoxGeometry(1, 1, 1)
		let material = new window.three.MeshBasicMaterial({color: 0x00ff00})
	 	this.cube = new window.three.Mesh(geometry, material)
		this.scene.add(this.cube)

		this.camera.position.z = 5

		this.update()
	}

	this.resize = () => {
		this.camera.aspect = (window.innerWidth) / (window.innerHeight - window.$('#action-bar').height())
	  this.camera.updateProjectionMatrix()

	  this.renderer.setSize(window.innerWidth, window.innerHeight - window.$('#action-bar').height())
	}

	this.update = () => {
		requestAnimationFrame(this.update)

		let delta = this.clock.getDelta()

		this.camera.controls.update(delta)

		this.cube.rotation.x += 0.01
		this.cube.rotation.y += 0.01

		this.renderer.render(this.scene, this.camera)
	}
}
