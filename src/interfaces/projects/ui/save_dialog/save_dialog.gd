extends FileDialog
## Projects Save Dialog



## Built-In Virtual Methods
func _ready() -> void:
	access = FileDialog.ACCESS_FILESYSTEM
	get_viewport().connect("size_changed", self, "center")



## Public Methods
func center() -> void:
	rect_position = (get_viewport().size / 2) - (rect_size / 2)



## Private Methods
func _on_file_selected(path : String):
	get_node("/root/VoxlyProjects").save_project(path)
