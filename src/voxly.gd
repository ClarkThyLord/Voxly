extends Node
# Voxly



## Private Variables
var _interfaces := []

var _plugins := []



## Built-In Virtual Methods
func _ready() -> void:
	for interface in _interfaces:
		interface.activate()
	
	for plugin in _plugins:
		plugin.activate()


func _exit_tree() -> void:
	for interface in _interfaces:
		interface.deactivate()
	
	for plugin in _plugins:
		plugin.deactivate()



## Public Methods
func connect_interface(interface : VoxlyInterface) -> void:
	_interfaces.append(interface)


func connect_plugin(plugin : VoxlyPlugin) -> void:
	_plugins.append(plugin)


func forward_input(camera : Camera, event : InputEvent) -> bool:
	var consumed := false
	
	consumed = camera.handle_input(event)
	
	return consumed
