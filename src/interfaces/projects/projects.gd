extends VoxlyInterface
## Projects Interface



## Constants
const PRESETS_DIR := "res://src/interfaces/projects/presets/"



## Private Variables
var _project : Spatial



## Public Virtual Methods
func profile_name() -> String:
	return "voxly.projects"


func profile_version() -> String:
	return "0.0.1"


func profile_properties() -> Array:
	return [
		_profile_property_string("default_preset", "default"),
	]



## Private Virtual Methods
func _activated() -> void:
	new_project("default")


func _deactivated() -> void:
	pass



## Public Methods
func get_preset_path(preset : String) -> String:
	if not get_presets().has(preset):
		print("Error preset '" + preset + "' doesn't exist...")
		return ""
	return PRESETS_DIR + preset + ".tscn"


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
	return _project


func new_project(preset : String) -> void:
	var preset_path := get_preset_path(preset)
	if preset_path:
		open_project(load(preset_path).instance() as Spatial)
	else:
		print("An error occured when trying to create a new project from '" + str(preset) + "' preset...")


func save_project(project_path : String) -> int:
	var project := PackedScene.new()
	var error := project.pack(_project)
	if error == OK:
		error = ResourceSaver.save(project_path, project)
		ResourceSaver.free()
	return error


func open_project(project) -> int:
	close_project()
	_project = project
	add_child(_project)
	return OK


func open_project_from(project_path : String) -> int:
	return open_project(load(project_path).instance())


func close_project() -> void:
	if is_instance_valid(_project):
		remove_child(_project)
		_project.queue_free()
