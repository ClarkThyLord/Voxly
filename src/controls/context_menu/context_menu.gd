extends PopupMenu
# Singleton context menu used throughout the editor



## Public Methods
func open(position : Vector2) -> void:
	set_as_minsize()
	ContextMenu.popup(Rect2(position, rect_size))


func close() -> void:
	hide()
