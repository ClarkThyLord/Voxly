extends VoxlyInterface
## Tools Interface



## Private Variables
var _tools := []



## Public Virtual Methods
func profile_name() -> String:
	return "voxly.tools"


func profile_version() -> String:
	return "0.0.0"



## Public Methods
func add_tool(_tool : VoxlyTool) -> void:
	_tools.append(_tool)


func remove_tool(_tool : VoxlyTool) -> void:
	_tools.erase(_tool)


func get_tool(tool_name : String) -> VoxlyTool:
	for _tool in _tools:
		if _tool.name == tool_name:
			return _tool
	return null


func get_tools() -> Array:
	var tools = []
	for _tool in _tools:
		tools.append(_tool)
	return tools


func is_tool(tool_name : String) -> bool:
	return is_instance_valid(get_tool(tool_name))
