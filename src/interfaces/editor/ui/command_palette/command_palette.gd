extends LineEdit
## Command Palette


## OnReady Variables
onready var commands := get_node("Commands")


## Private Methods
func _on_focus_entered():
	print(get_global_rect().position)
	commands.popup(Rect2(
		get_global_rect().position,
		commands.get_minimum_size()
	))


func _on_focus_exited():
	commands.hide()
