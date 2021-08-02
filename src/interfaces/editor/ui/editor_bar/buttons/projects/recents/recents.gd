extends PopupMenu
## Project Recents Menu



## Built-In Virtual Methods
func _ready() -> void:
	get_parent().connect("about_to_show", self, "_on_about_to_show")



## Private Methods
func _on_about_to_show():
	clear()
	for recent in get_node("/root/VoxlyProjects").get_recent_projects():
		add_item(recent)


func _on_index_pressed(index : int):
	get_node("/root/VoxlyProjects").open_project_from(get_item_text(index))
