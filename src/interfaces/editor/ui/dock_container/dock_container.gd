extends TabContainer
## Dock Container



## OnReady Variables
onready var menu := preload("res://src/interfaces/editor/ui/dock_container/menu/menu.tscn").instance()



## Built-In Virtual Methods
func _ready() -> void:
	set_popup(menu)
	add_child(menu)
	menu.connect("move_dock", self, "_on_Menu_move_dock")
	
	set_tabs_rearrange_group(0)



## Public Methods
func get_dock(dock_index : int):
	return get_tab_control(dock_index)


func get_current_dock():
	return get_current_tab_control()


func get_current_dock_index():
	return current_tab


func get_docks_count() -> int:
	return get_tab_count()


func move_dock(position : int, dock_index : int) -> void:
	get_node("/root/VoxlyEditor").add_dock(
			position, get_dock(dock_index))


func move_current_dock(position : int) -> void:
	move_dock(position, get_current_dock_index())



## Private Methods
func _on_sort_children():
	visible = get_docks_count() > 0


func _on_Menu_move_dock(position : int) -> void:
	move_current_dock(position)
