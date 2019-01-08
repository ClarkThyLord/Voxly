export default {
	name: 'add',
	update: function (e, domElement) {
		window._editor.mouse.set((event.offsetX / window.innerWidth ) * 2 - 1, -(event.offsetY / window.$('canvas').height()) * 2 + 1)
		window._editor.raycaster.setFromCamera(window._editor.mouse, window._editor.camera)

		let intersects = window._editor.raycaster.intersectObjects(window._editor.scene.children, true)
		if (intersects.length <= 0) return;

		let intersect = intersects[0];

		let voxel = new window.three.Mesh(
			new window.three.BoxBufferGeometry(0.5, 0.5, 0.5),
			new window.three.MeshLambertMaterial({ color: 'green' })
		)

		let temp = new window.three.Vector3()
		temp.copy(intersect.point).add(intersect.face.normal.multiplyScalar(0.25))
		temp = window._editor.position_to_grid(temp)
		voxel.position.copy(temp);
		window._editor.layer.add(voxel)
	}
}
