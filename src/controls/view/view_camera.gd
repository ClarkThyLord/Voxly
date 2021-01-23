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

var _is_boosting := false



## Built-In Virtual Methods
func _process(delta : float):
	if not focused:
		return
	
	if Input.is_mouse_button_pressed(BUTTON_RIGHT):
		var direction := Vector3()
		if Input.is_action_pressed("camera_forward"):
			direction += Vector3.FORWARD
		if Input.is_action_pressed("camera_back"):
			direction += Vector3.BACK
		if Input.is_action_pressed("camera_right"):
			direction += Vector3.RIGHT
		if Input.is_action_pressed("camera_left"):
			direction += Vector3.LEFT
		
		translate(
				direction * speed * 
				(boost if Input.is_action_just_pressed("camera_boost") else 1) * delta)



## Public Methods
func handle_input(event : InputEvent) -> bool:
	if not focused:
		return false
	
	var consumed := false
	if event is InputEventMouseMotion and event.button_mask == BUTTON_MASK_RIGHT:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			_mouse_position = get_viewport().get_mouse_position()
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
		var movement : Vector2 = event.relative.normalized()
		var x := rotation_degrees.x + (-movement.y * sensitivity)
		if x <= 90.0 and x >= -90.0:
			rotation_degrees.x = x
		rotation_degrees.y += -movement.x * sensitivity
		get_tree().set_input_as_handled()
		consumed = true
	elif event is InputEventMouseButton and not event.is_pressed():
		match event.button_index:
			BUTTON_LEFT:
				var from := project_ray_origin(event.position)
				var to := from + project_ray_normal(event.position) * 1000
				var hit := get_world().direct_space_state.intersect_ray(from, to)
				print(hit)
				consumed = true
			BUTTON_RIGHT:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				owner.warp_mouse(_mouse_position)
				consumed = true
	
	return consumed
