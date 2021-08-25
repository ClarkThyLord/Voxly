extends MarginContainer
## Project Preview



## Public Variables
export var project_path := "" setget set_project_path



## OnReady Variables
onready var project_name : Label = get_node("VBoxContainer/HBoxContainer/Name")

onready var open : Button = get_node("VBoxContainer/HBoxContainer/Open")

onready var explore : Button = get_node("VBoxContainer/HBoxContainer/Explore")

onready var remove : Button = get_node("VBoxContainer/HBoxContainer/Remove")



## Built-In Virtual Methods
func _ready() -> void:
	set_project_path(project_path)
	
	explore.visible = OS.get_name() in ["Windows", "OSX"]


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
	if get_node("/root/VoxlyProjects").is_preset(project_path):
		get_node("/root/VoxlyProjects").remove_preset(project_path)
	else:
		get_node("/root/VoxlyProjects").remove_recent_project(project_path)
