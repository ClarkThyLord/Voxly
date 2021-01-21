extends ViewportContainer
# Used to view scene, can be split horizontally and vertically into sub views



## Built-In Virtual Methods
func _gui_input(event : InputEvent) -> void:
	if event is InputEventMouseButton and not event.is_pressed():
		match event.button_index:
			BUTTON_RIGHT:
				var context_menu : PopupMenu = get_node("/root/ContextMenu")
				context_menu.clear()
				
				if is_split():
					context_menu.add_item("Merge views", 2)
					context_menu.add_separator()
				
				context_menu.add_item("Split vertically", 1)
				context_menu.add_item("Split horizontally", 0)
				
				context_menu.connect("id_pressed", self, "_on_ContextMenu_id_pressed")
				context_menu.connect("popup_hide", self, "_on_ContextMenu_id_popup_hide")
				
				context_menu.open(event.global_position)



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


func _on_ContextMenu_id_pressed(id : int) -> void:
	var context_menu : PopupMenu = get_node("/root/ContextMenu")
	match id:
		0: # Split horizontally
			split_horizontally()
		1: # Split vertically
			split_vertically()
		2: # Merge views
			merge_view()


func _on_ContextMenu_id_popup_hide() -> void:
	var context_menu : PopupMenu = get_node("/root/ContextMenu")
	if context_menu.is_connected("id_pressed", self, "_on_ContextMenu_id_pressed"):
		context_menu.disconnect("id_pressed", self, "_on_ContextMenu_id_pressed")
	if context_menu.is_connected("popup_hide", self, "_on_ContextMenu_id_popup_hide"):
		context_menu.disconnect("popup_hide", self, "_on_ContextMenu_id_popup_hide")
	
