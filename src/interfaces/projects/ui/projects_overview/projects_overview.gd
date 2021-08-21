extends PanelContainer
## Projects Overview



## Constants
const project_preview := preload("res://src/interfaces/projects/ui/projects_overview/project_preview/project_preview.tscn")



## OnReady Variables
onready var search : LineEdit = get_node("ProjectsOverview/VBoxContainer/HBoxContainer/Search")

onready var presets : VBoxContainer = get_node("ProjectsOverview/VBoxContainer/VBoxContainer/Presets/ScrollContainer/VBoxContainer")

onready var recents : VBoxContainer = get_node("ProjectsOverview/VBoxContainer/VBoxContainer/Recents/ScrollContainer/VBoxContainer")



## Built-In Virtual Methods
func _ready():
	visible = false



## Public Methods
func refresh() -> void:
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
	
	var search_term = search.text.to_lower()
	for project_preview in presets.get_children():
		if search_term:
			project_preview.visible = project_preview\
				.get_project_name().to_lower().find(search_term) > -1
		else:
			project_preview.visible = true
	
	for project_preview in recents.get_children():
		if search_term:
			project_preview.visible = project_preview\
				.get_project_name().to_lower().find(search_term) > -1
		else:
			project_preview.visible = true



## Private Methods
func _on_visibility_changed():
	refresh()


func _on_Load_pressed():
	get_node("/root/VoxlyProjects").show_projects_load_dialog()
	get_node("/root/VoxlyProjects").hide_projects_overview()


func _on_New_pressed():
	get_node("/root/VoxlyProjects").new_project()
	get_node("/root/VoxlyProjects").hide_projects_overview()


func _on_Close_pressed():
	hide()


func _search_projects(search_term : String) -> void:
	refresh()


func _on_Search_text_changed(new_text : String) -> void:
	_search_projects(new_text)


func _on_SearchEnter_pressed():
	_search_projects(search.text)
