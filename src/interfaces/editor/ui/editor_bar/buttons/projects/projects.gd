extends MenuButton



## OnReady Variables
onready var options : PopupMenu = get_popup()

onready var recents : PopupMenu = preload("res://src/interfaces/editor/ui/editor_bar/buttons/projects/recents/recents.tscn").instance()



## Built-In Virtual Methods
func _ready() -> void:
	options.add_child(recents)



## Private Methods
func _on_about_to_show():
	options.clear()
	
	options.add_item("New project...", 0)
	options.add_item("Load project...", 1)
	options.add_submenu_item("Recent projects...", "Recents", 2)
#	options.set_item_disabled(2, true)
	
	options.add_separator()
	options.add_item("Save project", 3)
	options.add_item("Save project as...", 4)
