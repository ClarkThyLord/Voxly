extends VoxlyInterface
## Projects Interface



## Constants
const PRESETS_DIR := "res://src/projects/presets/"



## Private Variables
var _project : Spatial = null



## OnReady Variables
onready var projects_menu := preload("res://src/interfaces/projects/ui/projects_menu/projects_menu.tscn").instance()




## Private Virtual Methods
func _activated() -> void:
	get_node("/root/VoxlyEditor").add_button_to_editor_bar_left(projects_menu)


func _deactivated() -> void:
	get_node("/root/VoxlyEditor").remove_button_to_editor_bar_left(projects_menu)



## Public Methods
func get_presets() -> Array:
	var presets := []
	var presets_dir = Directory.new()
	if presets_dir.open(PRESETS_DIR) == OK:
		presets_dir.list_dir_begin()
		var file_name = presets_dir.get_next()
		while file_name != "":
			if not presets_dir.current_is_dir():
				presets.append(file_name.get_basename())
			file_name = presets_dir.get_next()
	else:
		print("An error occurred when trying to access project presets...")
	return presets


func get_project():
	return


func new_project() -> void:
	pass


func save_project(project_name : String) -> int:
	return OK


func open_project(project) -> int:
	if is_instance_valid(_project):
		remove_child(_project)
		_project.queue_free()
	_project = project
	add_child(_project)
	return OK


func open_project_from(project_path : String) -> int:
	return open_project(load(project_path).instance())


func close_project() -> void:
	pass
