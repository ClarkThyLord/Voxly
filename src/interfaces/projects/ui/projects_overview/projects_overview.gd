extends PanelContainer
## Projects Overview



## Constants
const project_preview := preload("res://src/interfaces/projects/ui/projects_overview/project_preview/project_preview.tscn")



## OnReady Variables
onready var presets := get_node("ProjectsOverview/VBoxContainer/VBoxContainer/Presets/ScrollContainer/VBoxContainer")

onready var recents := get_node("ProjectsOverview/VBoxContainer/VBoxContainer/Recents/ScrollContainer/VBoxContainer")



## Built-In Virtual Methods
func _ready():
	visible = false



## Private Methods
func _on_visibility_changed():
	for child in presets.get_children():
		presets.remove_child(child)
		child.queue_free()
	for project_path in get_node("/root/VoxlyProjects").get_presets():
		var _project_preview := project_preview.instance()
		_project_preview.project_path = project_path
		presets.add_child(_project_preview)
	
	for child in recents.get_children():
		recents.remove_child(child)
		child.queue_free()
	for project_path in get_node("/root/VoxlyProjects").get_recent_projects():
		var _project_preview := project_preview.instance()
		_project_preview.project_path = project_path
		recents.add_child(_project_preview)


func _on_Load_pressed():
	get_node("/root/VoxlyProjects").show_projects_load_dialog()


func _on_Open_pressed():
	pass # Replace with function body.


func _on_Close_pressed():
	hide()
