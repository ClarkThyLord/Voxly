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
func set_project_path(value : String) -> void:
	project_path = value
	if is_instance_valid(project_name):
		project_name.text = project_path.get_file()\
				.replace("." + project_path.get_extension(), "").capitalize()
