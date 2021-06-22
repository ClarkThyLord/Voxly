extends TabContainer
## Dock Container



## OnReady Variables
onready var menu := preload("res://src/interfaces/editor/ui/dock_container/menu/menu.tscn").instance()



## Built-In Virtual Methods
func _ready() -> void:
	set_popup(menu)
	add_child(menu)
	
	set_tabs_rearrange_group(0)



## Private Methods
func _on_sort_children():
	visible = get_child_count() > 1
