extends PopupMenu
## Dock Container Menu



## Signals
signal move_dock(position)



## OnReady Variables
onready var dock_positions := PopupMenu.new()



## Built-In Virtual Methods
func _ready() -> void:
	dock_positions.name = "DockPositions"
	for position in get_node("/root/VoxlyEditor").DockPositions.keys():
		dock_positions.add_item(position.capitalize())
	add_child(dock_positions)
	dock_positions.connect("index_pressed", self, "_on_DockPositions_index_pressed")



## Private Methods
func _on_about_to_show():
	clear()
	
	add_submenu_item("Move to...", dock_positions.name)


func _on_DockPositions_index_pressed(index : int) -> void:
	emit_signal("move_dock", index)
