extends VoxlyInterface
## Commands Interface



## Private Variables
var _commands := {}



## Public Methods
func add_command(
		name : String,
		object : Object,
		method : String,
		description : String = "") -> int:
	if _commands.has(name):
		return ERR_ALREADY_EXISTS
	
	_commands[name] = {
		"name" : name,
		"description": description,
		"object": object,
		"method" : method,
	}
	
	return OK


func remove_command(
		command_name : String) -> bool:
	return _commands.erase(command_name)


func get_command(
		command_name : String) -> Dictionary:
	return _commands.get(command_name, {}).duplicate()


func get_commands() -> Array:
	return _commands.keys()


func search_commands(
		sub_string : String,
		limit : int = INF) -> Array:
	var matches := []
	sub_string = sub_string.to_lower()
	for command_name in get_commands():
		if command_name.to_lower().find(sub_string) > -1:
			matches.append(command_name)
			if matches.size() == limit:
				break
	return matches


func do_command(
		command_name : String) -> int:
	var command := get_command(command_name)
	if not command.empty():
		return command["object"].call(command["method"])
	return FAILED
