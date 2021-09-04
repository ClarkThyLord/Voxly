extends WindowDialog
## Preset Save Dialog



## OnReady Variables
onready var preset_name : LineEdit = get_node("MarginContainer/VBoxContainer/Name")

onready var save : Button = get_node("MarginContainer/VBoxContainer/HBoxContainer/Save")



## Private Methods
func _on_about_to_show():
	preset_name.text = ""


func _on_Name_text_changed(new_text : String):
	save.disabled = new_text.empty()
