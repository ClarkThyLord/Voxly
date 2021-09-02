extends PopupMenu
## Project Recents Menu



## Public Methods
func refresh():
	clear()
	for recent in get_node("/root/VoxlyProjects").get_recent_projects():
		add_item(recent)



## Private Methods
func _on_index_pressed(index : int):
	get_node("/root/VoxlyProjects").open_project_from(get_item_text(index))
