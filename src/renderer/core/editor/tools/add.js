export default {
	name: 'add',
	update: function (e, domElement) {
		window._editor.mouse.set((event.offsetX / window.innerWidth ) * 2 - 1, -(event.offsetY / window.$('canvas').height()) * 2 + 1)
		window._editor.raycaster.setFromCamera(window._editor.mouse, window._editor.camera)

		let intersects = window._editor.raycaster.intersectObjects(window._editor.scene.children, true)
		if (intersects.length <= 0) return;

		let intersect = intersects[0];

		let voxel = new window.three.Mesh(
			new window.three.BoxBufferGeometry(1, 1, 1),
			new window.three.MeshLambertMaterial({ color: 'green' })
		)

		voxel.position.copy(intersect.point)
		window._editor.layer.add(voxel)
	}
}
