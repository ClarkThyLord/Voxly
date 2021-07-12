extends MenuButton



## OnReady Variables
onready var options : PopupMenu = get_popup()

onready var recents : PopupMenu = preload("res://src/interfaces/editor/ui/editor_bar/buttons/projects/recents/recents.tscn").instance()

onready var save_project_dialog : FileDialog = get_node("Save")

onready var open_project_dialog : FileDialog = get_node("Open")



## Built-In Virtual Methods
func _ready() -> void:
	options.add_child(recents)
	
	get_popup().connect("index_pressed", self, "_on_index_pressed")



## Private Methods
func _on_about_to_show():
	options.clear()
	
	options.add_item("New project...")
	options.add_item("Load project...")
	options.add_submenu_item("Recent projects...", "Recents")
	options.set_item_disabled(2, true)
	
	options.add_separator()
	options.add_item("Save project")
	options.add_item("Save project as...")


func _on_index_pressed(index : int):
	match index:
		0:
			get_node("/root/VoxlyProjects").new_project()
		1:
			open_project_dialog.popup_centered_minsize()
		2:
			pass
		4:
			save_project_dialog.popup_centered_minsize()
		5:
			save_project_dialog.popup_centered_minsize()
