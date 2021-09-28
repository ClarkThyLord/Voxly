extends VoxlyInterface
## Selections Interface



## Private Variables
var _selections := []



## Public Virtual Methods
func profile_name() -> String:
	return "voxly.selections"


func profile_version() -> String:
	return "0.0.0"



## Public Methods
func add_selection(selection : VoxlySelect) -> void:
	_selections.append(selection)


func remove_selection(selection : VoxlySelect) -> void:
	_selections.erase(selection)


func get_selections() -> Array:
	var selections = []
	for _selection in _selections:
		selections.append(_selection)
	return selections
