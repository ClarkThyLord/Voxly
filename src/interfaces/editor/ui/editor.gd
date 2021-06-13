extends Panel
## Editor UI



## OnReady Variables
onready var editor_bar_left : HBoxContainer = get_node("VBoxContainer/EditorBar/Left")

onready var editor_bar_center : HBoxContainer = get_node("VBoxContainer/EditorBar/Center")

onready var editor_bar_right : HBoxContainer = get_node("VBoxContainer/EditorBar/Right")

onready var editor_tools : HBoxContainer = get_node("VBoxContainer/Workspace/HSplitContainer/VSplitContainer/VBoxContainer/ToolBar/Tools")

onready var scene_views : PanelContainer = get_node("VBoxContainer/Workspace/HSplitContainer/VSplitContainer/VBoxContainer/SceneViews")




## Public Methods
func add_button_to_editor_bar_left(
		button : Button) -> void:
	editor_bar_left.add_child(button)


func remove_button_from_editor_bar_left(
		button : Button) -> void:
	editor_bar_left.remove_child(button)


func add_button_to_editor_bar_center(
		button : Button) -> void:
	editor_bar_center.add_child(button)


func remove_button_from_editor_bar_center(
		button : Button) -> void:
	editor_bar_center.remove_child(button)


func add_button_to_editor_bar_right(
		button : Button) -> void:
	editor_bar_right.add_child(button)


func remove_button_from_editor_bar_right(
		button : Button) -> void:
	editor_bar_right.remove_child(button)


func add_button_to_editor_tools(
		button : Button) -> void:
	editor_tools.add_child(button)


func remove_button_from_editor_tools(
		button : Button) -> void:
	editor_tools.remove_child(button)
