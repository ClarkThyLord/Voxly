import CameraControls from './editor/camera-controls.js'

export default new editor()

function editor() {
	this.tool = 'add'
	this.tools = [
		require('./editor/tools/add.js').default,
		require('./editor/tools/remove.js').default
	]

	this.get_action = (name) => {
		return this.tools.find((tool) => {
			return tool.name == name
		})
	}

	this.init = () => {
		this.scene = new window.three.Scene()

		this.ground = new window.three.Mesh(
			new window.three.PlaneBufferGeometry( 10, 10, 10 ),
			new window.three.MeshBasicMaterial( {wireframe: true} )
		);
		this.scene.add(this.ground);

		this.layer = this.add_layer({name: 'base layer'})
		this.scene.add(this.layers)

		let ligth = new window.three.AmbientLight(0x606060);
		this.layer.add(ligth);

		this.camera = new window.three.PerspectiveCamera(75, 1, 0.1, 1000)

		this.clock = new window.three.Clock()

		this.renderer = new window.three.WebGLRenderer({
			canvas: window.$('#workspace canvas')[0],
			antialias: true
		})
		this.resize()

		window.addEventListener('resize', this.resize, false)

		window.$(this.renderer.domElement).on('tool', (e, ov, domElement) => {
			let tool = this.get_action(this.tool)
			if (tool) tool.update(ov, domElement)
		})

		this.mouse = new window.three.Vector2()

		this.camera.controls = new CameraControls(this.camera, this.renderer.domElement)
		this.camera.position.y -= 7
		this.camera.position.z = 7
		this.camera.lookAt(0, 0, 0)

		this.raycaster = new window.three.Raycaster()

		this._update()
	}

	this.resize = () => {
		this.camera.aspect = (window.innerWidth) / (window.innerHeight - window.$('#action-bar').height())
	  this.camera.updateProjectionMatrix()

	  this.renderer.setSize(window.innerWidth, window.innerHeight - window.$('#action-bar').height())
	}

	this.update = () => {
		let delta = this.clock.getDelta()

		this.camera.controls.update(delta)

		this.renderer.render(this.scene, this.camera)
	}

	this._update = () => {
		requestAnimationFrame(this._update)
		this.update()
	}

	this.position_to_grid = function (position) {
		return position.divideScalar(0.5).floor().multiplyScalar(0.5).addScalar(0.25)
	}

	this.layer = undefined
	this.layers = new window.three.Group()

	this.new_layer = function (options) {
		let layer = new window.three.Group()
		layer.name = options.name || 'new layer'

		if (options.objects) {
			for (let object of options.objects) {
				layer.objects.add(object)
			}
		}

		return layer
	}

	this.add_layer = (options, parent_layer) => {
		let layer = this.new_layer(options)

		if (parent_layer) {
			parent_layer.add(layer)
		} else {
			this.layers.add(layer)
		}

		return layer
	}

	this.remove_layer = (layer) => {
		layer.parent.remove(layer)
	}
}
