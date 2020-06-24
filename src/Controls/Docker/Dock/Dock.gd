tool
extends Container
class_name Dock



# Declarations
onready var panel : PanelContainer

onready var options_left : HBoxContainer
onready var options_center : HBoxContainer
onready var options_right : HBoxContainer

onready var content : Panel
onready var content_ref : Control




# Core
func _notification(what : int):
	match what:
		NOTIFICATION_SORT_CHILDREN:
			sort_children()


func _ready():
	for child in get_children():
		if child is Control:
			content_ref = child
			break
	
	panel = PanelContainer.new()
	.add_child(panel)
	var container := VBoxContainer.new()
	panel.add_child(container)
	
	
	var options := HBoxContainer.new()
	container.add_child(options)
	
	var view := Button.new()
	view.text = "View"
	options.add_child(view)
	var separator := VSeparator.new()
	options.add_child(separator)
	
	options_left = HBoxContainer.new()
	options_left.size_flags_horizontal = SIZE_EXPAND_FILL
	options.add_child(options_left)
	options_center = HBoxContainer.new()
	options_center.alignment = BoxContainer.ALIGN_CENTER
	options_center.size_flags_horizontal = SIZE_EXPAND_FILL
	options.add_child(options_center)
	options_right = HBoxContainer.new()
	options_right.alignment = BoxContainer.ALIGN_END
	options_right.size_flags_horizontal = SIZE_EXPAND_FILL
	options.add_child(options_right)
	
	
	content = Panel.new()
	content.size_flags_vertical = SIZE_EXPAND_FILL
	container.add_child(content)
	
	
	sort_children()


func _get_minimum_size() -> Vector2:
	return Vector2(125, 125)

func add_child(node : Node, legible_unique_name := false) -> void:
	if node is Control:
		if get_child_count() >= 2:
			printerr("Dock already has content")
			return
		else:
			content_ref = node
	else:
		printerr("Dock content can only be Control")
		return
	.add_child(node, legible_unique_name)


func sort_children() -> void:
	fit_child_in_rect(panel, Rect2(Vector2(), rect_size))
	if get_child_count() >= 2:
		yield(get_tree(), "idle_frame")
		fit_child_in_rect(content_ref, Rect2(
			content.rect_global_position - rect_global_position,
			content.rect_size
			)
		)
		move_child(content_ref, 1)
