extends Panel
## Editor UI



## OnReady Variables
onready var editor_bar_left : HBoxContainer setget set_editor_bar_left, get_editor_bar_left

onready var editor_bar_center : HBoxContainer setget set_editor_bar_center, get_editor_bar_center

onready var editor_bar_right : HBoxContainer setget set_editor_bar_right, get_editor_bar_right

onready var editor_tools : HBoxContainer setget set_editor_tools, get_editor_tools

onready var scene_views : PanelContainer setget set_editor_scene_views, get_editor_scene_views



## Public Methods
func set_editor_bar_left(control : HBoxContainer) -> void:
	return


func get_editor_bar_left() -> HBoxContainer:
	return get_node_or_null("VBoxContainer/EditorBar/Left") as HBoxContainer


func set_editor_bar_center(control : HBoxContainer) -> void:
	return


func get_editor_bar_center() -> HBoxContainer:
	return get_node_or_null("VBoxContainer/EditorBar/Center") as HBoxContainer


func set_editor_bar_right(control : HBoxContainer) -> void:
	return


func get_editor_bar_right() -> HBoxContainer:
	return get_node_or_null("VBoxContainer/EditorBar/Right") as HBoxContainer


func set_editor_tools(control : HBoxContainer) -> void:
	return


func get_editor_tools() -> HBoxContainer:
	return get_node_or_null("VBoxContainer/Workspace/HSplitContainer/VSplitContainer/VBoxContainer/ToolBar/Tools") as HBoxContainer


func set_editor_scene_views(control : PanelContainer) -> void:
	return


func get_editor_scene_views() -> PanelContainer:
	return get_node_or_null("VBoxContainer/Workspace/HSplitContainer/VSplitContainer/VBoxContainer/SceneViews") as PanelContainer
