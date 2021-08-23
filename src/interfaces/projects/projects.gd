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
		_profile_property_string(
			"default_preset",
			"res://src/interfaces/projects/presets/default.tscn"
		),
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


func remove_project(project_path : String) -> void:
	if project_path in __recent_projects__:
		__recent_projects__.erase(project_path)
	
	var dir = Directory.new()
	dir.remove(project_path)
	
	if is_instance_valid(projects_overview):
		projects_overview.refresh()


func add_recent_project(project_path : String) -> void:
	if project_path.is_abs_path():
		if __recent_projects__.has(project_path):
			__recent_projects__.erase(project_path)
		__recent_projects__.insert(0, project_path)
		if __recent_projects__.size() > 5:
			__recent_projects__.pop_back()
	
	if is_instance_valid(projects_overview):
		projects_overview.refresh()


func get_recent_projects() -> Array:
	return __recent_projects__.duplicate()


func add_preset(name : String, node : Node = _project) -> int:
	var path : String = PRESETS_DIR + name + ".tscn"
	var result : int = _save_node(_project, path)
	
	if is_instance_valid(projects_overview):
		projects_overview.refresh()
	
	return result


func is_preset(project_path : String) -> bool:
	return project_path.begins_with(PRESETS_DIR)


func get_presets() -> Array:
	var presets := []
	var presets_dir := Directory.new()
	if presets_dir.open(PRESETS_DIR) == OK:
		presets_dir.list_dir_begin(true, true)
		var file_name := presets_dir.get_next()
		while file_name != "":
			if not presets_dir.current_is_dir():
				presets.append(PRESETS_DIR + file_name)
			file_name = presets_dir.get_next()
	else:
		print_stack()
		printerr("Error when opening project presets")
	return presets


func new_project(project_path : String = "") -> void:
	if project_path.empty():
		close_project()
	else:
		if project_path.is_abs_path():
			open_project(load(project_path).instance() as Spatial)
			_project_path = ""
		else:
			print_stack()
			printerr("Error when creating new project from `" + str(project_path) + "`")


func save_project(project_path : String = _project_path) -> int:
	var error := _save_node(_project, project_path)
	if error == OK:
		add_recent_project(project_path)
		_project_path = project_path
	return error


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


func show_projects_overview() -> void:
	projects_overview.show()


func hide_projects_overview() -> void:
	projects_overview.hide()


func show_projects_save_dialog() -> void:
	projects_save_dialog.popup_centered_minsize()


func show_projects_load_dialog() -> void:
	projects_load_dialog.popup_centered_minsize()



## Private Methods
func _save_node(node : Node, path : String) -> int:
	if is_instance_valid(node):
		var packed_scene := PackedScene.new()
		var error := packed_scene.pack(node)
		if error == OK:
			error = ResourceSaver.save(path, packed_scene)
		if not error == OK:
			print_stack()
			printerr("Error when saving `" + path + "`, code: " + str(error))
		return error
	return FAILED
