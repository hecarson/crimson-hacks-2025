extends Camera3D

var is_mouse_captured = true
var mouse_sens = 0.003
var move_sens = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x * mouse_sens
		rotation.x -= event.relative.y * mouse_sens
	elif event is InputEventKey and event.pressed:
		if event.keycode == Key.KEY_C:
			is_mouse_captured = !is_mouse_captured
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_mouse_captured:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	var velocity = Vector3.ZERO
	if Input.is_action_pressed("move_forward"):
		velocity = Vector3.FORWARD
	elif Input.is_action_pressed("move_back"):
		velocity = Vector3.BACK
	elif Input.is_action_pressed("move_left"):
		velocity = Vector3.LEFT
	elif Input.is_action_pressed("move_right"):
		velocity = Vector3.RIGHT
	elif Input.is_action_pressed("move_up"):
		velocity = Vector3.UP
	elif Input.is_action_pressed("move_down"):
		velocity = Vector3.DOWN
	velocity *= move_sens
	translate_object_local(velocity)
