extends Camera
# Camera used in view



## Exported Variables
export(float, 0.0, 100.0) var speed := 12.0

export(float, 1.0, 10.0) var boost := 2.25

export(float, 0.0, 10.0) var sensitivity := 1.0



## Public Variables
var focused := false



## Private Variables
var _mouse_position := Vector2()

var _direction := Vector3.ZERO

var _is_boosting := false



## Built-In Virtual Methods
func _process(delta : float):
	if not focused:
		return
	
	var _direction := Vector3()
	if Input.is_action_pressed("camera_forward"):
		_direction += Vector3.FORWARD
	if Input.is_action_pressed("camera_back"):
		_direction += Vector3.BACK
	if Input.is_action_pressed("camera_right"):
		_direction += Vector3.RIGHT
	if Input.is_action_pressed("camera_left"):
		_direction += Vector3.LEFT
	
	translate(
			_direction * speed * 
			(boost if _is_boosting else 1) * delta)



## Public Methods
func _input(event : InputEvent):
	if not focused:
		return
	
	_direction = Vector3()
	if event is InputEventMouseMotion and event.button_mask == BUTTON_MASK_RIGHT:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			_mouse_position = get_viewport().get_mouse_position()
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
		if event is InputEventMouseMotion:
			var movement : Vector2 = event.relative.normalized()
			var x := rotation_degrees.x + (-movement.y * sensitivity)
			if x <= 90.0 and x >= -90.0:
				rotation_degrees.x = x
			rotation_degrees.y += -movement.x * sensitivity
			get_tree().set_input_as_handled()
		
		if Input.is_action_pressed("camera_forward"):
			_direction += Vector3.FORWARD
		if Input.is_action_pressed("camera_back"):
			_direction += Vector3.BACK
		if Input.is_action_pressed("camera_right"):
			_direction += Vector3.RIGHT
		if Input.is_action_pressed("camera_left"):
			_direction += Vector3.LEFT
		
		_is_boosting = Input.is_action_just_pressed("camera_boost")
	elif event is InputEventMouseButton and event.button_index == BUTTON_RIGHT and not event.is_pressed():
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		owner.warp_mouse(_mouse_position)
