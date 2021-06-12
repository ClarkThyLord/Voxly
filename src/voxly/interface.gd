extends VoxlyPlugin
class_name VoxlyInterface
## Voxly Interface Class



## Built-In Virtual Methods
func _ready() -> void:
	get_node("/root/Voxly").connect_interface(self)
