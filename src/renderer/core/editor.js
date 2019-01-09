import controls from './editor/controls.js'

export default new editor()

function editor() {
	this.init = (views) => {

		this.scene = new window.three.Scene()

		this.layer = this.add_layer({name: 'base layer'})
		this.scene.add(this.layers)

		this.camera = new window.three.PerspectiveCamera(75, 1, 0.1, 1000)

		this.clock = new window.three.Clock()

		this.raycaster = new window.three.Raycaster()

		this.ligth = new window.three.AmbientLight(0x606060)
		this.layer.add(this.ligth)

		this.ground = new window.three.Mesh(
			new window.three.PlaneBufferGeometry(10, 10, 10),
			new window.three.MeshBasicMaterial({wireframe: true})
		);
		this.scene.add(this.ground)

		for (let view of views) {
			this.new_view({
				canvas: view,
				scene: this.scene
			})
		}

		window.addEventListener('resize', this.resize, false)

		this._update()
	}

	this.update = () => {
		let delta = this.clock.getDelta()

		for (let view of this.views) {
			view.update(delta)
		}
	}

	this._update = () => {
		requestAnimationFrame(this._update)
		this.update()
	}

	this.resize = () => {
		for (let view of this.views) {
			view.resize()
		}
	}

	this.pos_to_grid = function (position) {
		return position.divideScalar(0.5).floor().multiplyScalar(0.5).addScalar(0.25)
	}

	this.tool = 'add'
	this.tools = [
		require('./editor/tools/add.js').default,
		require('./editor/tools/remove.js').default
	]

	this.get_tool = (name) => {
		return this.tools.find((tool) => {
			return tool.name == name
		})
	}

	this.activate_tool = (e, view) => {
		this.get_tool(this.tool).update(e, view)
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

	this.view = undefined
	this.views = []

	this.View = function (options) {
		options = options || {}

		this.options = options.scene

		this.camera = new window.three.PerspectiveCamera(75, 1, 0.1, 1000)
		this.camera.position.y -= 7
		this.camera.position.z = 7
		this.camera.lookAt(0, 0, 0)

		this.renderer = new window.three.WebGLRenderer({
			canvas: options.canvas,
			antialias: true
		})

		this.controls = new controls(this)

		this.update = (delta) => {
			this.controls.update(delta)

			this.renderer.render(window._editor.scene, this.camera)
		}

		this.resize = () => {
			this.camera.aspect = this.renderer.domElement.parentNode.offsetWidth / this.renderer.domElement.parentNode.offsetHeight
		  this.camera.updateProjectionMatrix()

		  this.renderer.setSize(this.renderer.domElement.parentNode.offsetWidth, this.renderer.domElement.parentNode.offsetHeight)
		}

		this.resize()
	}

	this.new_view = (options) => {
		let view = new this.View(options)

		this.views.push(view)

		return view
	}
}
