extends VoxlyInterface
## Editor Interface



## Constants
enum DockPositions {
	LEFT_TOP,
	LEFT_BOTTOM,
	RIGHT_TOP,
	RIGHT_BOTTOM,
}



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


func add_dock(
		name : String,
		position : int,
		control : Control) -> void:
	control.name = name
	remove_dock(control)
	match position:
		DockPositions.LEFT_TOP:
			ui.dock_left_top.add_child(control)
		DockPositions.LEFT_BOTTOM:
			ui.dock_left_bottom.add_child(control)
		DockPositions.RIGHT_TOP:
			ui.dock_right_top.add_child(control)
		DockPositions.RIGHT_BOTTOM:
			ui.dock_right_bottom.add_child(control)


func remove_dock(
		control : Control) -> void:
	var parent := control.get_parent()
	if is_instance_valid(parent):
		parent.remove_child(control)
