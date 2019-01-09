export default {
	name: 'remove',
	update: function (e, view) {
		let intersects = window._editor.raycaster.intersectObjects(window._editor.scene.children, true)
		if (intersects.length <= 0) return;

		let intersect = intersects[0];

		if (intersect.object.name != 'voxel') return;
		intersect.object.parent.remove(intersect.object)
	}
}
