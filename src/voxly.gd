extends Node
# Voxly interface



## Public Methods
func forward_input(camera : Camera, event : InputEvent) -> bool:
	var consumed := false
	
	consumed = camera.handle_input(event)
	
	return consumed
