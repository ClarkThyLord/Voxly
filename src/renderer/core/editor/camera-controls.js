export default function (camera, domElement) {
	this.camera = camera
	this.domElement = domElement

	this.speed = 10
	this.sensitivity = 100

	this.moving = false
	this.movement = new window.three.Vector3(0, 0, 0)

	window.$(this.domElement).on('camera.move', (e, ov) => {
		if (window.hotkeys.areSomePressed(window._actions.get('camera foward').hotkeys)) this.movement.z -= 1;
		if (window.hotkeys.areSomePressed(window._actions.get('camera backwards').hotkeys)) this.movement.z += 1;
		if (window.hotkeys.areSomePressed(window._actions.get('camera up').hotkeys)) this.movement.y += 1;
		if (window.hotkeys.areSomePressed(window._actions.get('camera down').hotkeys)) this.movement.y -= 1;
		if (window.hotkeys.areSomePressed(window._actions.get('camera right').hotkeys)) this.movement.x += 1;
		if (window.hotkeys.areSomePressed(window._actions.get('camera left').hotkeys)) this.movement.x -= 1;

		this.moving = true
	})

	this.update = (delta) => {
		if (!this.moving) return;
		this.moving = false

		this.movement.clampScalar(-1, 1)
		let motion = this.speed * (delta || 0.02)
		this.camera.translateX(this.movement.x * motion)
		this.camera.translateY(this.movement.y * motion)
		this.camera.translateZ(this.movement.z * motion)
		this.movement.set(0, 0, 0)
	}
}
