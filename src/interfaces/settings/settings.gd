extends Node
## Settings Interface



## Constants
const PROFILE := {
	"version": "0.0.0",
	"magic": "profile.voxly",
	"profiles": {},
}

const PROFILE_DIR := "res://src/settings/profiles/"



## Private Variables
var _profile : Dictionary



## Public Method
func load_profile(projects_path := PROFILE_DIR) -> int:
	var file = File.new()
	var error = file.open(projects_path, File.READ)
	if error == OK:
		var content = file.get_as_text()
		var json = JSON.parse(content)
		if json.error == OK:
			if typeof(json.result) == TYPE_DICTIONARY:
				_profile = json.result
			else:
				error = ERR_FILE_UNRECOGNIZED
		else:
			error = json.error
	if file.is_open():
		file.close()
	return error


func save_profile(projects_path := PROFILE_DIR) -> int:
	var file = File.new()
	var error = file.open(projects_path, File.WRITE)
	if error == OK:
		file.store_string(JSON.print(_profile, "\t"))
	if file.is_open():
		file.close()
	return error
