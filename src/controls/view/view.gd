extends ViewportContainer
# Used to view scene, can be split into sub views horizontally and vertically



## OnReady Variables
onready var options : MenuButton = get_node("Options")

onready var options_menu : PopupMenu = options.get_popup()

onready var camera : Camera = get_node("Viewport/Camera")



## Built-In Virtual Methods
func _ready() -> void:
	options_menu.connect("id_pressed", self, "_on_options_menu_id_pressed")


func _gui_input(event : InputEvent) -> void:
	pass



## Public Methods
func is_split() -> bool:
	return get_parent() is SplitContainer


func split_horizontally() -> void:
	_split_view(VSplitContainer.new())


func split_vertically() -> void:
	_split_view(HSplitContainer.new())


func merge_view() -> void:
	var parent := get_parent()
	if parent.get_child_count() == 2:
		parent.remove_child(self)
		
		var grandparent := parent.get_parent()
		grandparent.remove_child(parent)
		parent.queue_free()
		
		grandparent.add_child(self)
		set_anchors_and_margins_preset(Control.PRESET_WIDE)



## Private Methods
func _split_view(split : SplitContainer) -> void:
	var parent := get_parent()
	var position := get_position_in_parent()
	parent.remove_child(self)
	
	parent.add_child(split)
	parent.move_child(split, position)
	split.anchor_right = 1.0
	split.anchor_bottom = 1.0
	split.size_flags_horizontal = SIZE_EXPAND_FILL
	split.size_flags_vertical = SIZE_EXPAND_FILL
	
	split.add_child(self)
	var new_view := duplicate()
	split.add_child(new_view)


func _on_mouse_entered():
	camera.focused = true


func _on_mouse_exited():
	camera.focused = false


func _on_options_about_to_show():
	options_menu.clear()
	if is_split():
		options_menu.add_item("Merge views", 2)
		options_menu.add_separator()
	
	options_menu.add_item("Split vertically", 1)
	options_menu.add_item("Split horizontally", 0)


func _on_options_menu_id_pressed(id : int) -> void:
	match id:
		0: # Split horizontally
			split_horizontally()
		1: # Split vertically
			split_vertically()
		2: # Merge views
			merge_view()


