extends Node
class_name VoxlyPlugin
## Voxly Plugin Class



## Constants
const PROFILES_DIR : String = "res://src/profiles/"



## Private Variables
var _active : bool = false

onready var _profile := {
	"magic": profile_name(),
	"version": profile_version(),
	"properties": profile_properties(),
}



## Built-In Virtual Methods
func _enter_tree() -> void:
	load_profile()


func _exit_tree() -> void:
	save_profile()



## Public Virtual Methods
func profile_name() -> String:
	return ""


func profile_version() -> String:
	return "0.0.0"


func profile_properties() -> Array:
	return []



## Private Virtual Methods
func _activated() -> void:
	pass


func _deactivated() -> void:
	pass



## Public Methods
func activate() -> void:
	if not _active:
		_activated()


func deactivate() -> void:
	if _active:
		_deactivated()


func get_profile_path() -> String:
	return PROFILES_DIR + profile_name() + ".json"


func save_profile() -> int:
	if profile_name() == "" or profile_version() == "0.0.0":
		return ERR_UNAVAILABLE
	var file = File.new()
	var error = file.open(get_profile_path(), File.WRITE)
	if error == OK:
		var __meta__ := get_meta_list()
		if not __meta__.empty():
			_profile["__meta__"] = {}
			for name in __meta__:
				_profile["__meta__"][name] = get_meta(name)
		
		file.store_string(JSON.print(_profile, "\t"))
		
		if _profile.has("__meta__"):
			_profile.erase("__meta__")
	if file.is_open():
		file.close()
	return error


func load_profile() -> int:
	var file = File.new()
	var error = file.open(get_profile_path(), File.READ)
	if error == OK:
		var content = file.get_as_text()
		var json = JSON.parse(content)
		if json.error == OK:
			if typeof(json.result) == TYPE_DICTIONARY \
					and json.result.get("magic") == profile_name():
				if json.result.has("__meta__"):
					for name in json.result["__meta__"].keys():
						set_meta(name, json.result["__meta__"][name])
					json.result.erase("__meta__")
				
				_profile = json.result
			else:
				error = ERR_FILE_UNRECOGNIZED
		else:
			error = json.error
	if file.is_open():
		file.close()
	return error


func reset_profile() -> void:
	_profile["properties"] = profile_properties()


func get_profile_property(property_path : String):
	if not property_path.empty():
		var path_index := 0
		var path := property_path.split("/")
		var properties : Array = _profile["properties"]
		while typeof(properties) == TYPE_ARRAY:
			var found := false
			for property in properties:
				property = property as Dictionary
				if property["name"] == path[path_index]:
					found = true
					path_index += 1
					var at_end := path_index == path.size()
					if property["type"] == -1 and not at_end:
						properties = property["properties"]
						break
					else:
						return property
			if not found:
				break
	return null


func get_profile_property_value(property_path : String):
	if not property_path.empty():
		var path_index := 0
		var path := property_path.split("/")
		var properties : Array = _profile["properties"]
		while typeof(properties) == TYPE_ARRAY:
			var found := false
			for property in properties:
				property = property as Dictionary
				if property["name"] == path[path_index]:
					found = true
					path_index += 1
					var at_end := path_index == path.size()
					if property["type"] == -1 and not at_end:
						properties = property["properties"]
						break
					else:
						return property.get("value")
			if not found:
				break
	return null


func set_profile_property_value(
		property_path : String,
		value):
	if not property_path.empty():
		var path_index := 0
		var path := property_path.split("/")
		var properties : Array = _profile["properties"]
		while typeof(properties) == TYPE_ARRAY:
			var found := false
			for property in properties:
				property = property as Dictionary
				if property["name"] == path[path_index]:
					found = true
					path_index += 1
					var at_end := path_index == path.size()
					if property["type"] == -1 and not at_end:
						properties = property["properties"]
						break
					else:
						property["value"] = value
			if not found:
				break



## Private Methods
func _profile_property(
			name : String,
			default) -> Dictionary:
	return {
		"name": name,
		"type": typeof(default),
		"default": default,
		"value": default,
	}


func _profile_property_group(
			name : String,
			properties : Array) -> Dictionary:
	return {
		"name": name,
		"type": -1,
		"properties": properties,
	}


func _profile_property_bool(
			name : String,
			default : bool) -> Dictionary:
	var property = _profile_property(name, default)
	return property


func _profile_property_int(
			name : String,
			default : int,
			step : int = 0,
			min_value : int = -INF,
			max_value : int = INF) -> Dictionary:
	var property = _profile_property(name, default)
	if step > 0:
		property["step"] = step
	if min_value > -INF:
		property["minimum"] = min_value
	if min_value < INF:
		property["maximum"] = max_value
	return property


func _profile_property_float(
			name : String,
			default : int,
			step : float = 0.0,
			min_value : float = -INF,
			max_value : float = INF) -> Dictionary:
	var property = _profile_property(name, default)
	if step > 0.0:
		property["step"] = step
	if min_value > -INF:
		property["minimum"] = min_value
	if min_value < INF:
		property["maximum"] = max_value
	return property


func _profile_property_string(
			name : String,
			default : String) -> Dictionary:
	var property = _profile_property(name, default)
	return property


func _profile_property_options(
			name : String,
			default : String,
			options : PoolStringArray) -> Dictionary:
	var property = _profile_property(name, default)
	property["options"] = options
	return property


func _profile_property_color(
			name : String,
			default : Color,
			rgba : bool = true) -> Dictionary:
	var property = _profile_property(name, default)
	if not rgba:
		property["rgba"] = false
	return property
