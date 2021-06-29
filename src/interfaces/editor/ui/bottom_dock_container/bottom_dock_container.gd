extends PanelContainer
## Bottom Dock Container



## Private Variables
var _bottom_dock : Control = null

var _bottom_docks := {}

var _bottom_docks_buttons := {}

var _bottom_docks_buttons_group := ButtonGroup.new()



## OnReady Variables
onready var bottom_dock : MarginContainer setget set_bottom_dock, get_bottom_dock

onready var bottom_dock_buttons : HBoxContainer setget set_bottom_dock_buttons, get_bottom_dock_buttons



## Public Methods
func set_bottom_dock_buttons(control) -> void:
	return


func get_bottom_dock_buttons():
	return get_node_or_null("VBoxContainer/BottomDocksButtons")


func set_bottom_dock(control) -> void:
	return


func get_bottom_dock():
	return get_node_or_null("VBoxContainer/BottomDock")


func add_child(
		node : Node,
		legible_unique_name : bool = false) -> void:
	remove_child(node)
	
	var dock_button := ToolButton.new()
	dock_button.text = node.name
	dock_button.toggle_mode = true
	dock_button.group = _bottom_docks_buttons_group
	_bottom_docks[str(node)] = dock_button
	_bottom_docks_buttons[str(dock_button)] = node
	dock_button.connect("pressed", self, "_on_BottomDockButton_pressed", [dock_button])
	self.bottom_dock_buttons.add_child(dock_button)
	
	node.visible = false
	self.bottom_dock.add_child(node)


func remove_child(node : Node) -> void:
	var dock_button : ToolButton = _bottom_docks.get(str(node))
	if is_instance_valid(dock_button):
		var parent := dock_button.get_parent()
		if is_instance_valid(parent):
			parent.remove_child(dock_button)
		dock_button.group = null
		dock_button.queue_free()
		_bottom_docks.erase(str(node))
		_bottom_docks_buttons.erase(str(dock_button))
	
	var parent := node.get_parent()
	if is_instance_valid(parent):
		parent.remove_child(node)



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
