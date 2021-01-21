extends Camera
# Camera used in view



## Exported Variables
export(float, 0.0, 100.0) var speed := 12.0

export(float, 1.0, 10.0) var boost := 2.25

export(float, 0.0, 10.0) var sensitivity := 1.0



## Public Variables
var focused := false



## Built-In Virtual Methods
func _process(delta : float):
	if not focused:
		return
	
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
func handle_input(event : InputEvent) -> void:
	if not focused:
		return
	
	if event is InputEventMouseMotion:
		var movement : Vector2 = event.relative.normalized()
		rotation_degrees.x += -movement.y * sensitivity
		rotation_degrees.y += -movement.x * sensitivity
