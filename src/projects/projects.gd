extends Node
## Projects Interface



## Private Variables
var _projects := []



## Public Methods
func current_project() -> String:
	return ""


func get_project(project_name : String):
	return


func get_projects() -> Array:
	return []


func new_project(project_name : String) -> void:
	pass


func save_project(project_name : String) -> int:
	return OK


func open_project(project) -> int:
	return OK


func open_project_from(project_path : String) -> int:
	return OK


func close_project(project_name : String) -> void:
	pass
