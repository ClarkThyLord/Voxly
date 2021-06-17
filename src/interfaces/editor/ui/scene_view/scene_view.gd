extends ViewportContainer
# Used to view scene, can be split into sub views horizontally and vertically



## OnReady Variables
onready var viewport : Viewport = get_node("Viewport")

onready var camera : Camera = get_node("Viewport/SceneCamera")

onready var options : MenuButton = get_node("Options")

onready var options_menu : PopupMenu = options.get_popup()



## Built-In Virtual Methods
func _ready() -> void:
	viewport.size = rect_size
	
	options_menu.connect("id_pressed", self, "_on_OptionsMenu_id_pressed")


func _gui_input(event : InputEvent) -> void:
	if get_node("/root/Voxly").forward_input(camera, event):
		accept_event()



## Public Methods
func is_split() -> bool:
	return get_parent() is SplitContainer


func can_split_vertically() -> bool:
	return rect_size.x / rect_min_size.x > 2


func can_split_horizontally() -> bool:
	return rect_size.y / rect_min_size.y > 2


func split_vertically() -> void:
	if not can_split_vertically():
		printerr("Cannot split SceneView vertically")
	
	_split_view(HSplitContainer.new())


func split_horizontally() -> void:
	if not can_split_horizontally():
		printerr("Cannot split SceneView horizontally")
	
	_split_view(VSplitContainer.new())


func merge_split() -> void:
	var parent := get_parent()
	if is_split():
		parent.remove_child(self)
		
		var grandparent := parent.get_parent()
		grandparent.add_child_below_node(parent, self)
		grandparent.remove_child(parent)
		parent.queue_free()
		
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


func _on_OptionsMenu_about_to_show():
	options_menu.clear()
	var separate := false
	if is_split():
		separate = true
		options_menu.add_item("Merge views", 2)
	
	if can_split_vertically():
		if separate:
			separate = false
			options_menu.add_separator()
		options_menu.add_item("Split vertically", 1)
	if can_split_horizontally():
		if separate:
			separate = false
			options_menu.add_separator()
		options_menu.add_item("Split horizontally", 0)


func _on_OptionsMenu_id_pressed(id : int) -> void:
	match id:
		0: # Split horizontally
			split_horizontally()
		1: # Split vertically
			split_vertically()
		2: # Merge views
			merge_split()
