export default {
	name: 'add',
	update: function (e, view) {
		let intersects = window._editor.raycaster.intersectObjects(window._editor.scene.children, true)
		if (intersects.length <= 0) return;

		let intersect = intersects[0];

		let voxel = new window.three.Mesh(
			new window.three.BoxBufferGeometry(0.5, 0.5, 0.5),
			new window.three.MeshLambertMaterial({ color: 'green' })
		)

		voxel.name = 'voxel'

		let temp = new window.three.Vector3()
		temp.copy(intersect.point).add(intersect.face.normal.multiplyScalar(0.25))
		temp = window._editor.pos_to_grid(temp)
		voxel.position.copy(temp);
		window._editor.layer.add(voxel)
	}
}
