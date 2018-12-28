export default function (camera, domElement) {
	this.camera = camera
	this.domElement = domElement

	this.speed = 10
	this.sensitivity = 100

	this.moving = false
	this.movement = new window.three.Vector3(0, 0, 0)

	$(this.domElement).on('camera.foward', (e, ov) => {
		this.movement.z -= 1
		this.moving = true
	})

	$(this.domElement).on('camera.backwards', (e, ov) => {
		this.movement.z += 1
		this.moving = true
	})

	$(this.domElement).on('camera.up', (e, ov) => {
		this.movement.y += 1
		this.moving = true
	})

	$(this.domElement).on('camera.right', (e, ov) => {
		this.movement.x += 1
		this.moving = true
	})

	$(this.domElement).on('camera.down', (e, ov) => {
		this.movement.y -= 1
		this.moving = true
	})

	$(this.domElement).on('camera.left', (e, ov) => {
		this.movement.x -= 1
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
