extends LineEdit
## Command Palette



## Private Variables
var _command_button_focused : Button = null



## OnReady Variables
onready var commands := get_node("Commands")

onready var command_buttons := get_node("Commands/CommandButtons")



## Built-In Virtual Methods
func _ready() -> void:
	commands.visible = false
	
	for command_button in command_buttons.get_children():
		command_button.connect(
			"focus_entered", self, "_on_CommandButton_focuse_entered",
			[command_button])
		command_button.connect(
			"focus_exited", self, "_on_CommandButton_focuse_exited",
			[command_button])
		command_button.connect(
			"pressed", self, "_on_CommandButton_pressed",
			[command_button])


func _input(event : InputEvent) -> void:
	if event is InputEventMouseButton:
		if has_focus():
			if not get_global_rect().has_point(event.position):
				release_focus()
		elif is_instance_valid(_command_button_focused):
			if not _command_button_focused\
					.get_global_rect().has_point(event.position):
				release_focus()



## Public Methods
func release_focus() -> void:
	commands.hide()
	.release_focus()



## Private Methods
func _on_focus_entered() -> void:
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


func _on_focus_exited() -> void:
	yield(get_tree(), "idle_frame")
	if not is_instance_valid(_command_button_focused):
		commands.hide()


func _on_text_changed(new_text : String) -> void:
	pass


func _on_CommandButton_focuse_entered(command_button : Button) -> void:
	_command_button_focused = command_button


func _on_CommandButton_focuse_exited(command_button : Button) -> void:
	if command_button == _command_button_focused:
		_command_button_focused = null


func _on_CommandButton_pressed(command_button : Button) -> void:
	command_button.release_focus()
	commands.hide()
