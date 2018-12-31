export default function (camera, domElement) {
	this.camera = camera
	this.domElement = domElement

	this.speed = 10
	this.sensitivity = 100

	this.moving = false
	this.movement = new window.three.Vector3(0, 0, 0)

	this.active = false
	this.type = -1
	this.activity = new window.three.Vector2(0, 0)
	this._activity = new window.three.Vector2(0, 0)
	this.__activity = new window.three.Vector2(0, 0)

	this.activate = (x, y) => {
		this.__activity.set(x, y)
		this.activity.subVectors(this.__activity, this._activity).clampScalar(-1, 1)
		this._activity.set(x, y)
	}

	this.zoom = () => {

	}

	this.rotate = () => {

	}

	this.translate = () => {

	}

	window.$(this.domElement).on('camera.move', (e, ov) => {
		if (window.hotkeys.areSomePressed(window._actions.get('camera foward').hotkeys)) this.movement.z -= 1;
		if (window.hotkeys.areSomePressed(window._actions.get('camera backwards').hotkeys)) this.movement.z += 1;
		if (window.hotkeys.areSomePressed(window._actions.get('camera up').hotkeys)) this.movement.y += 1;
		if (window.hotkeys.areSomePressed(window._actions.get('camera down').hotkeys)) this.movement.y -= 1;
		if (window.hotkeys.areSomePressed(window._actions.get('camera right').hotkeys)) this.movement.x += 1;
		if (window.hotkeys.areSomePressed(window._actions.get('camera left').hotkeys)) this.movement.x -= 1;

		this.moving = true
	})

	window.$(domElement).on('contextmenu', (e) => {
		event.preventDefault()
	})

	window.$(domElement).on('wheel', (e) => {
		if (e.originalEvent.deltaY > 0) this.movement.z += 1;
		if (e.originalEvent.deltaY < 0) this.movement.z -= 1;

		this.moving = true
	});

	window.$(domElement).on('mousedown', (e) => {
		if (e.button == 2 ) {
			this.active = true
			this.activate(e.screenX, e.screenY)
		}
	})

	window.$(domElement).on('mousemove', (e) => {
		if (!this.active) return false;

		this.activate(e.screenX, e.screenY)

		if (this.activity.y > 0) this.movement.y -= 1;
		if (this.activity.y < 0) this.movement.y += 1;
		if (this.activity.x > 0) this.movement.x += 1;
		if (this.activity.x < 0) this.movement.x -= 1;
	})

	window.$(domElement).on('mouseup mouseleave', (e) => {
		if (!this.active) return false;

		if (e.type == 'mouseleave' || e.button == 2) {
			this.active = false
			this.activate(e.screenX, e.screenY)
		}
	})

	window.$(domElement).on('touchstart', (e) => {
		console.log('touch down');

		this.active = true
	})

	window.$(domElement).on('touchmove', (e) => {
		if (!this.active) return false;

		console.log('touch move');
	})

	window.$(domElement).on('touchend touchleave', (e) => {
		if (!this.active) return false;

		console.log('touch up/leave');

		this.active = false
	})

	this.update = (delta) => {
		if (!this.moving && !this.active) return;
		this.moving = false

		this.movement.clampScalar(-1, 1)
		let motion = this.speed * (delta || 0.02)
		this.camera.translateX(this.movement.x * motion)
		this.camera.translateY(this.movement.y * motion)
		this.camera.translateZ(this.movement.z * motion)
		this.movement.set(0, 0, 0)
	}
}
