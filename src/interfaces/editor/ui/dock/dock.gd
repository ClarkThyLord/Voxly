extends TabContainer
## Dock



## OnReady Variables
onready var menu := PopupMenu.new()



## Built-In Virtual Methods
func _ready() -> void:
	menu.name = "Menu"
	add_child(menu)
	set_popup(menu)
	
	set_tabs_rearrange_group(0)



## Private Methods
func _on_sort_children():
	visible = get_child_count() > 1
