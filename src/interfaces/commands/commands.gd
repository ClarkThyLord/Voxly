extends VoxlyInterface
## Commands Interface



## Public Methods
func add_command(
		name : String,
		object : Object,
		function : String,
		description : String = "") -> int:
	return -1


func remove_command(
		command_id : int) -> bool:
	return false


func get_command() -> Dictionary:
	return {}


func get_commands() -> Array:
	return []


func search_commands(
		limit : int = INF) -> Array:
	return []


func do_command(
		command_id : int) -> bool:
	return false
