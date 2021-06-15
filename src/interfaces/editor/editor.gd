extends VoxlyInterface
## Editor Interface



## OnReady Variables
onready var ui := get_node("/root/Editor")



## Public Methods
func add_button_to_editor_bar_left(
		button : Button) -> void:
	ui.editor_bar_left.add_child(button)


func remove_button_from_editor_bar_left(
		button : Button) -> void:
	ui.editor_bar_left.remove_child(button)


func add_button_to_editor_bar_center(
		button : Button) -> void:
	ui.editor_bar_center.add_child(button)


func remove_button_from_editor_bar_center(
		button : Button) -> void:
	ui.editor_bar_center.remove_child(button)


func add_button_to_editor_bar_right(
		button : Button) -> void:
	ui.editor_bar_right.add_child(button)


func remove_button_from_editor_bar_right(
		button : Button) -> void:
	ui.editor_bar_right.remove_child(button)


func add_button_to_editor_tools(
		button : Button) -> void:
	ui.editor_tools.add_child(button)


func remove_button_from_editor_tools(
		button : Button) -> void:
	ui.editor_tools.remove_child(button)
