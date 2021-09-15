extends WindowDialog
## Preset Save Dialog



## Private Variables
var regex = RegEx.new()



## OnReady Variables
onready var preset_name : LineEdit = get_node("MarginContainer/VBoxContainer/Name")

onready var save : Button = get_node("MarginContainer/VBoxContainer/HBoxContainer/Save")


## Built-In Virtual Methods
func _ready() -> void:
	regex.compile("^[a-zA-Z0-9 _]+$")


## Private Methods
func _on_about_to_show() -> void:
	preset_name.text = ""
	save.disabled = true


func _on_visibility_changed():
	if visible:
		yield(get_tree(), "idle_frame")
		preset_name.grab_focus()


func _on_Name_text_changed(new_text : String):
	save.disabled = new_text.empty()\
			or !(new_text.is_valid_filename() and regex.search(new_text))


func _on_Save_pressed():
	get_node("/root/VoxlyProjects").add_preset(
			preset_name.text,
			get_node("/root/VoxlyProjects").get_project())
	hide()


func _on_Cancel_pressed():
	hide()
