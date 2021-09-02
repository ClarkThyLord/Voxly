extends MenuButton
## Projects Editor Bar Button



## OnReady Variables
onready var options : PopupMenu = get_popup()

onready var recents_menu : PopupMenu = preload("res://src/interfaces/editor/ui/editor_bar/menus/projects_menu/recents_menu/recents_menu.tscn").instance()



## Built-In Virtual Methods
func _ready() -> void:
	options.add_child(recents_menu)
	
	get_popup().connect("id_pressed", self, "_on_id_pressed")


func refresh() -> void:
	options.clear()
	
	options.add_item("View projects", 2)
	
	options.add_separator()
	options.add_item("New project...", 0)
	options.add_item("Open project...", 1)
	recents_menu.refresh()
	options.add_submenu_item("Recent projects...", "RecentsMenu", 3)
	if recents_menu.get_item_count() == 0:
		options.set_item_disabled(options.get_item_count() - 1, true)
	
	options.add_separator()
	options.add_item("Save project", 4)
	if not get_node("/root/VoxlyProjects").get_project_path():
		options.set_item_disabled(options.get_item_count() - 1, true)
	options.add_item("Save project as...", 5)
	options.add_item("Save as preset...", 6)
	if not is_instance_valid(get_node("/root/VoxlyProjects").get_project()):
		options.set_item_disabled(options.get_item_count() - 3, true)
		options.set_item_disabled(options.get_item_count() - 2, true)
		options.set_item_disabled(options.get_item_count() - 1, true)



## Private Methods
func _on_about_to_show():
	refresh()


func _on_id_pressed(index : int):
	match index:
		0:
			get_node("/root/VoxlyProjects").new_project()
		1:
			get_node("/root/VoxlyProjects").show_projects_load_dialog()
		2:
			get_node("/root/VoxlyProjects").show_projects_overview()
		4:
			get_node("/root/VoxlyProjects").save_project()
		5:
			get_node("/root/VoxlyProjects").show_projects_save_dialog()
		6:
			get_node("/root/VoxlyProjects").add_preset(
					get_node("/root/VoxlyProjects").get_project_path().get_file(),
					get_node("/root/VoxlyProjects").get_project())
