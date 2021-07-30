extends PopupMenu
## Project Recents Menu



## Built-In Virtual Methods
func _ready() -> void:
	for recent in get_node("/root/VoxlyProjects").get_recent_projects():
		add_item(recent)
