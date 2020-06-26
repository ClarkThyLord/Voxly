tool
extends Container
class_name Docker



# Refrences
onready var context_menu : PopupMenu



# Theme defaults
const margin_constant := 5



# Declarations
var split : Dock
var split_at : Vector2
var split_vertical := false


export(bool) var Vertical := false

export(PoolIntArray) var SectionsGrowth : PoolIntArray setget set_sections_growth
func set_sections_growth(sections_growth : PoolIntArray) -> void:
	var sum := 0
	for growth_index in range(sections_growth.size()):
		if sum == 100:
			sections_growth.remove(sections_growth.size() - 1)
		else:
			if sum + sections_growth[growth_index] > 100:
				sections_growth[growth_index] -= sections_growth[growth_index] - 100
			sum += sections_growth[growth_index]
	SectionsGrowth = sections_growth
	property_list_changed_notify()



# Core
func _notification(what : int):
	match what:
		NOTIFICATION_SORT_CHILDREN:
			sort_children()


func sort_children() -> void:
	var offset := margin_constant
	var sect_size := rect_size - Vector2(offset, offset)
	var docking := []
	for child in get_children():
		if child is Dock:
			docking.append(child)
	sect_size[int(Vertical)] /= docking.size()
	for dock_index in range(docking.size()):
		var child = docking[dock_index]
		var position = Vector2()
		position[int(Vertical)] = dock_index * sect_size[int(Vertical)]
		fit_child_in_rect(
			child,
			Rect2(
				position + Vector2(offset, offset),
				sect_size - Vector2(offset, offset)
			)
		)


func _ready():
	context_menu = PopupMenu.new()
	context_menu.add_item("Split horizontal", 0)
	context_menu.add_item("Split vertical", 1)
	context_menu.set_as_minsize()
	context_menu.connect("id_pressed", self, "context_menu_id_pressed")
	add_child(context_menu)
	
	if SectionsGrowth.size() == 0:
		add_dock(0)
	sort_children()


func add_dock(idx : int) -> int:
	if idx == -1 and SectionsGrowth.size() == 0:
		pass
	elif idx <= SectionsGrowth.size():
		printerr("Docker index out of range")
		return ERR_PARAMETER_RANGE_ERROR
	elif SectionsGrowth.size() == 10:
		printerr("Docker can maximum have 10 docks")
		return ERR_PARAMETER_RANGE_ERROR
	return OK

func split_at(idx : int, vertical := false) -> void:
	pass

func merge_at(idx : int, idx : int) -> void:
	pass

func grow_at(idx : int, growth : int) -> void:
	pass

func grow_uniform() -> void:
	pass


func context_menu_id_pressed(id : int) -> void:
	match id:
		0:
			pass
		1:
			pass


func _gui_input(event : InputEvent) -> void:
	if event is InputEventMouse:
		split_at = event.global_position
		var at_border := true
		if event.position.x < rect_size.x and event.position.x > rect_size.x - margin_constant:
			mouse_default_cursor_shape = Control.CURSOR_HSPLIT
		elif event.position.x > 0 and event.position.x < margin_constant:
			mouse_default_cursor_shape = Control.CURSOR_HSPLIT
		elif event.position.y < rect_size.y and event.position.y > rect_size.y - margin_constant:
			mouse_default_cursor_shape = Control.CURSOR_VSPLIT
		elif event.position.y > 0 and event.position.y < 0 + margin_constant:
			mouse_default_cursor_shape = Control.CURSOR_VSPLIT
		else:
			at_border = false
			if Vertical:
				mouse_default_cursor_shape = Control.CURSOR_VSPLIT
			else:
				mouse_default_cursor_shape = Control.CURSOR_HSPLIT
		if event is InputEventMouseButton:
			if not event.pressed and event.button_index == BUTTON_RIGHT:
				context_menu.show_on_top = true
				context_menu.popup(Rect2(
					event.global_position,
					context_menu.rect_size
					)
				)
