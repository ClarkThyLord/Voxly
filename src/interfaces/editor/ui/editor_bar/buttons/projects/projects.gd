extends MenuButton
## Projects Editor Bar Button



## OnReady Variables
onready var options : PopupMenu = get_popup()

onready var recents : PopupMenu = preload("res://src/interfaces/editor/ui/editor_bar/buttons/projects/recents/recents.tscn").instance()



## Built-In Virtual Methods
func _ready() -> void:
	options.add_child(recents)
	
	get_popup().connect("index_pressed", self, "_on_index_pressed")



## Private Methods
func _on_about_to_show():
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	
	options.clear()
	
	options.add_item("New project...")
	options.add_item("Load project...")
	options.add_submenu_item("Recent projects...", "Recents")
	if recents.get_item_count() == 0:
		options.set_item_disabled(options.get_item_count() - 1, true)
	
	options.add_separator()
	options.add_item("Save project")
	if not get_node("/root/VoxlyProjects").get_project_path():
		options.set_item_disabled(options.get_item_count() - 1, true)
	options.add_item("Save project as...")
	if not is_instance_valid(get_node("/root/VoxlyProjects").get_project()):
		options.set_item_disabled(options.get_item_count() - 2, true)
		options.set_item_disabled(options.get_item_count() - 1, true)


func _on_index_pressed(index : int):
	match index:
		0:
			get_node("/root/VoxlyProjects").new_project()
		1:
			get_node("/root/VoxlyProjects").show_load_project_dialog()
		4:
			get_node("/root/VoxlyProjects").save_project()
		5:
			get_node("/root/VoxlyProjects").show_save_project_dialog()
