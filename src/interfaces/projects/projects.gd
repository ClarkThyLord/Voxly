extends VoxlyInterface
## Projects Interface



## Constants
const PRESETS_DIR := "res://src/interfaces/projects/presets/"



## Private Variables
var _project : Spatial

var _project_path : String = ""

var __recent_projects__ := []



## OnReady Variables
onready var layer := CanvasLayer.new()

onready var projects_save_dialog : FileDialog = preload("res://src/interfaces/projects/ui/save_dialog/projects_save_dialog.tscn").instance()

onready var projects_load_dialog : FileDialog = preload("res://src/interfaces/projects/ui/load_dialog/projects_load_dialog.tscn").instance()

onready var projects_overview : Control = preload("res://src/interfaces/projects/ui/projects_overview/projects_overview.tscn").instance()



## Built-In Virtual Methods
func _ready() -> void:
	add_child(layer)
	layer.add_child(projects_overview)
	layer.add_child(projects_save_dialog)
	layer.add_child(projects_load_dialog)
	
	._ready()


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
	new_project(get_profile_property_value("default_preset"))


func _deactivated() -> void:
	pass



## Public Methods
func get_project():
	return _project


func get_project_path() -> String:
	return _project_path


func add_recent_project(project_path : String) -> void:
	if project_path.is_abs_path():
		if __recent_projects__.has(project_path):
			__recent_projects__.erase(project_path)
		__recent_projects__.insert(0, project_path)
		if __recent_projects__.size() > 5:
			__recent_projects__.pop_back()


func get_recent_projects() -> Array:
	return __recent_projects__.duplicate()


func get_preset_path(preset : String) -> String:
	if not get_presets().has(preset):
		print("Error preset '" + preset + "' not found")
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
		print("An error occurred when trying to open project presets...")
	return presets


func new_project(preset := "") -> void:
	if preset.empty():
		close_project()
	else:
		var preset_path := get_preset_path(preset)
		if preset_path:
			open_project(load(preset_path).instance() as Spatial)
			_project_path = ""
		else:
			print("An error occured when trying to create a new project from '" + str(preset) + "' preset...")


func save_project(project_path : String = _project_path) -> int:
	if is_instance_valid(_project) and project_path.is_abs_path():
		var project := PackedScene.new()
		var error := project.pack(_project)
		if error == OK:
			error = ResourceSaver.save(project_path, project)
			add_recent_project(project_path)
			_project_path = project_path
		return error
	return ERR_FILE_BAD_PATH


func open_project(project : Node) -> int:
	close_project()
	_project = project
	add_child(_project)
	return OK


func open_project_from(project_path : String) -> int:
	if project_path.is_abs_path():
		if not ResourceLoader.exists(project_path):
			return ERR_FILE_NOT_FOUND
		_project_path = project_path
		add_recent_project(project_path)
		return open_project(load(project_path).instance())
	return ERR_FILE_BAD_PATH


func close_project() -> void:
	if is_instance_valid(_project):
		remove_child(_project)
		_project.queue_free()


func show_projects_overview_dialog() -> void:
	projects_overview.show()


func show_projects_save_dialog() -> void:
	projects_save_dialog.popup_centered_minsize()


func show_projects_load_dialog() -> void:
	projects_load_dialog.popup_centered_minsize()
