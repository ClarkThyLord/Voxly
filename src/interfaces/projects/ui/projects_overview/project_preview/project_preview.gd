extends MarginContainer
## Project Preview



## Public Variables
export var project_path := "" setget set_project_path



## OnReady Variables
onready var project_name := get_node("VBoxContainer/HBoxContainer/Name")



## Built-In Virtual Methods
func _ready() -> void:
	set_project_path(project_path)


## Public Methods
func get_project_name() -> String:
	return project_name.text


func set_project_path(value : String) -> void:
	project_path = value
	if is_instance_valid(project_name):
		project_name.text = project_path.get_file()\
				.replace("." + project_path.get_extension(), "").capitalize()


func _on_Open_pressed():
	get_node("/root/VoxlyProjects").open_project_from(project_path)
	get_node("/root/VoxlyProjects").hide_projects_overview()


func _on_Explore_pressed():
	OS.shell_open(ProjectSettings.globalize_path(project_path.get_base_dir()))


func _on_Remove_pressed():
	pass # Replace with function body.
