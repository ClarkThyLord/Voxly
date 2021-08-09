extends PanelContainer
## Projects Overview



## Built-In Virtual Methods
func _ready():
	visible = false



## Private Methods
func _on_Load_pressed():
	get_node("/root/VoxlyProjects").show_projects_load_dialog()


func _on_Open_pressed():
	pass # Replace with function body.


func _on_Close_pressed():
	hide()
