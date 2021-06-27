extends VoxlyInterface
## Editor Interface



## Constants
enum DockPositions {
	LEFT_TOP,
	LEFT_BOTTOM,
	RIGHT_TOP,
	RIGHT_BOTTOM,
}



## Private Variables
var _bottom_dock : Control = null

var _bottom_docks := {}

var _bottom_docks_buttons := {}

var _bottom_docks_buttons_group := ButtonGroup.new()



## OnReady Variables
onready var ui := get_node("/root/Editor")



## Built-In Virtual Methods
func _ready() -> void:
	var projects := preload("res://src/interfaces/editor/ui/editor_bar/buttons/projects/projects.tscn").instance()
	add_button_to_editor_bar_left(projects)
	
	var edit := preload("res://src/interfaces/editor/ui/editor_bar/buttons/edit/edit.tscn").instance()
	add_button_to_editor_bar_left(edit)
	
	var view := preload("res://src/interfaces/editor/ui/editor_bar/buttons/view/view.tscn").instance()
	add_button_to_editor_bar_left(view)
	
	var help := preload("res://src/interfaces/editor/ui/editor_bar/buttons/help/help.tscn").instance()
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
	remove_bottom_dock(control)
	
	var dock_button := ToolButton.new()
	dock_button.text = control.name
	dock_button.toggle_mode = true
	dock_button.group = _bottom_docks_buttons_group
	_bottom_docks[str(control)] = dock_button
	_bottom_docks_buttons[str(dock_button)] = control
	dock_button.connect("pressed", self, "_on_BottomDockButton_pressed", [dock_button])
	ui.bottom_docks_buttons.add_child(dock_button)
	
	control.visible = false
	ui.dock_bottom.add_child(control)


func remove_bottom_dock(
		control : Control) -> void:
	var dock_button : ToolButton = _bottom_docks.get(str(control))
	if is_instance_valid(dock_button):
		var parent := dock_button.get_parent()
		if is_instance_valid(parent):
			parent.remove_child(dock_button)
		dock_button.group = null
		dock_button.queue_free()
		_bottom_docks.erase(str(control))
		_bottom_docks_buttons.erase(str(dock_button))
	
	var parent := control.get_parent()
	if is_instance_valid(parent):
		parent.remove_child(control)



## Private Methods
func _on_BottomDockButton_pressed(dock_button : ToolButton) -> void:
	if is_instance_valid(_bottom_dock):
		var _dock_button : ToolButton = _bottom_docks.get(str(_bottom_dock))
		if is_instance_valid(_dock_button):
			_dock_button.pressed = false
		_bottom_dock.visible = false
		_bottom_dock = null
	
	if dock_button.pressed:
		var dock : Control = _bottom_docks_buttons.get(str(dock_button))
		if is_instance_valid(dock):
			dock.visible = true
			_bottom_dock = dock
