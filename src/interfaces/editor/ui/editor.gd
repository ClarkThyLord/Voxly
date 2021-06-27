extends Panel
## Editor UI



## OnReady Variables
onready var editor_bar_left : HBoxContainer setget set_editor_bar_left, get_editor_bar_left

onready var editor_bar_center : HBoxContainer setget set_editor_bar_center, get_editor_bar_center

onready var editor_bar_right : HBoxContainer setget set_editor_bar_right, get_editor_bar_right

onready var editor_tools : HBoxContainer setget set_editor_tools, get_editor_tools

onready var scene_views : PanelContainer setget set_editor_scene_views, get_editor_scene_views

onready var left_docks : PanelContainer = get_node("VBoxContainer/Workspace/LeftDocks")

onready var dock_left_top setget set_dock_left_top, get_dock_left_top

onready var dock_left_bottom setget set_dock_left_bottom, get_dock_left_bottom

onready var right_docks : PanelContainer = get_node("VBoxContainer/Workspace/HSplitContainer/RightDocks")

onready var dock_right_top setget set_dock_right_top, get_dock_right_top

onready var dock_right_bottom setget set_dock_right_bottom, get_dock_right_bottom

onready var bottom_docks : PanelContainer = get_node("VBoxContainer/Workspace/HSplitContainer/VSplitContainer/BottomDocks")

onready var bottom_docks_buttons setget set_bottom_docks_buttons, get_bottom_docks_buttons

onready var dock_bottom setget set_dock_bottom, get_dock_bottom



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


func set_dock_left_top(dock) -> void:
	return


func get_dock_left_top():
	return get_node_or_null("VBoxContainer/Workspace/LeftDocks/VSplitContainer/TopDock")


func set_dock_left_bottom(dock) -> void:
	return


func get_dock_left_bottom():
	return get_node_or_null("VBoxContainer/Workspace/LeftDocks/VSplitContainer/BottomDock")


func set_dock_right_top(dock) -> void:
	return


func get_dock_right_top():
	return get_node_or_null("VBoxContainer/Workspace/HSplitContainer/RightDocks/VSplitContainer/TopDock")


func set_dock_right_bottom(dock) -> void:
	return


func get_dock_right_bottom():
	return get_node_or_null("VBoxContainer/Workspace/HSplitContainer/RightDocks/VSplitContainer/BottomDock")


func set_bottom_docks_buttons(control) -> void:
	return


func get_bottom_docks_buttons():
	return get_node_or_null("VBoxContainer/Workspace/HSplitContainer/VSplitContainer/BottomDocks/VBoxContainer/BottomDocksButtons")


func set_dock_bottom(dock) -> void:
	return


func get_dock_bottom():
	return get_node_or_null("VBoxContainer/Workspace/HSplitContainer/VSplitContainer/BottomDocks/VBoxContainer/BottomDock")


func _on_LeftDock_visibility_changed():
	left_docks.visible = self.dock_left_top.visible or self.dock_left_bottom.visible


func _on_RightDock_visibility_changed():
	right_docks.visible = self.dock_right_top.visible or self.dock_right_bottom.visible
