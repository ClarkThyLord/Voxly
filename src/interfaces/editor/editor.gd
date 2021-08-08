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



## Built-In Virtual Methods
func _ready() -> void:
	var projects := preload("res://src/interfaces/editor/ui/editor_bar/menus/projects_menu/projects_menu.tscn").instance()
	add_button_to_editor_bar_left(projects)
	
	var edit := preload("res://src/interfaces/editor/ui/editor_bar/menus/edit_menu/edit_menu.tscn").instance()
	add_button_to_editor_bar_left(edit)
	
	var view := preload("res://src/interfaces/editor/ui/editor_bar/menus/view_menu/view_menu.tscn").instance()
	add_button_to_editor_bar_left(view)
	
	var help := preload("res://src/interfaces/editor/ui/editor_bar/menus/help_menu/help_menu.tscn").instance()
	add_button_to_editor_bar_left(help)
	
	
	var scene_tree := preload("res://src/interfaces/editor/ui/docks/scene/scene.tscn").instance()
	add_dock(DockPositions.LEFT_TOP, scene_tree)
	
	var inspector := preload("res://src/interfaces/editor/ui/docks/inspector/inspector.tscn").instance()
	add_dock(DockPositions.LEFT_BOTTOM, inspector)
	
	var voxel_set := preload("res://src/interfaces/editor/ui/docks/voxel_set/voxel_set.tscn").instance()
	add_dock(DockPositions.RIGHT_TOP, voxel_set)
	
	var history := preload("res://src/interfaces/editor/ui/docks/history/history.tscn").instance()
	add_dock(DockPositions.RIGHT_BOTTOM, history)
	
	
	var animation := preload("res://src/interfaces/editor/ui/bottom_docks/Animation.tscn").instance()
	add_bottom_dock(animation)



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
		position : int,
		control : Control) -> void:
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


func add_bottom_dock(
		control : Control) -> void:
	ui.bottom_docks.add_child(control)


func remove_bottom_dock(
		control : Control) -> void:
	ui.bottom_docks.remove_child(control)
