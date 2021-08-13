extends HBoxContainer
## Project Preview



## Public Variables
export var project_path := "" setget set_project_path



## Public Methods
func set_project_path(value : String) -> void:
	if value.is_abs_path():
		project_path = value
		get_node("Name").text = project_path.get_file()\
				.replace("." + project_path.get_extension(), "").capitalize()
