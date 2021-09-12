extends PopupMenu
## Project Recents Menu



## Public Methods
func refresh():
	clear()
	for recent in get_node("/root/VoxlyProjects").get_recent_projects():
		add_item(recent, 0)
	add_separator()
	add_item("Clear Recent Projects", 1)



## Private Methods
func _on_id_pressed(id : int) -> void:
	match id:
		0:
			get_node("/root/VoxlyProjects")\
					.open_project_from(get_item_text(id))
		1:
			get_node("/root/VoxlyProjects").remove_recent_projects()
