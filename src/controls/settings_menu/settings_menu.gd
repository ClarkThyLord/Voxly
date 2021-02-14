extends PopupDialog



## Built-In Virtual Methods
func _ready() -> void:
	get_viewport().connect("size_changed", self, "center")



## Public Methods
func center() -> void:
	rect_position = (get_viewport().size / 2) - (rect_size / 2)



## Private Methods
func _on_Apply_pressed():
	hide()


func _on_Cancel_pressed():
	hide()
