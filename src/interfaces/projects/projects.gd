extends Node
## Projects Interface



## Constants
const PROJECTS := "res://src/projects/projects.json"

const PROJECTS_DEFAULT := {
	"version": "0.0.0",
	"magic": "voxly.projects",
	"preset.default": "",
	"projects.recent": "",
}

const PRESETS_DIR := "res://src/projects/presets/"



## Private Variables
var _project : Spatial = null

var _projects : Dictionary



## Built-In Virtual Methods
func _enter_tree() -> void:
	if not load_projects() == OK:
		_projects = PROJECTS_DEFAULT.duplicate(true)


func _exit_tree() -> void:
	save_projects()



## Public Methods
func load_projects(projects_path := PROJECTS) -> int:
	var file = File.new()
	var error = file.open(projects_path, File.READ)
	if error == OK:
		var content = file.get_as_text()
		var json = JSON.parse(content)
		if json.error == OK:
			if typeof(json.result) == TYPE_DICTIONARY \
					and json.result.get("magic") == PROJECTS_DEFAULT["magic"]:
				_projects = json.result
			else:
				error = ERR_FILE_UNRECOGNIZED
		else:
			error = json.error
	if file.is_open():
		file.close()
	return error


func save_projects(projects_path := PROJECTS) -> int:
	var file = File.new()
	var error = file.open(projects_path, File.WRITE)
	if error == OK:
		file.store_string(JSON.print(_projects, "\t"))
	if file.is_open():
		file.close()
	return error


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
