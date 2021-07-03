extends LineEdit
## Command Palette



## OnReady Variables
onready var commands := get_node("Commands")



## Built-In Virtual Methods
func _ready() -> void:
	commands.visible = false



## Private Methods
func _on_focus_entered():
	var rect := get_global_rect()
	commands.rect_position = Vector2(
		rect.position.x,
		rect.position.y + rect.size.y
	)
	commands.rect_size = Vector2(
		rect.size.x,
		commands.get_minimum_size().y
	)
	commands.show()
	commands.set_as_toplevel(true)


func _on_focus_exited():
	commands.hide()
