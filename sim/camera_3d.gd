extends Camera3D

var is_mouse_captured = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		print("mouse motion ", event)
	elif event is InputEventKey and event.keycode == Key.KEY_C and event.pressed:
		is_mouse_captured = !is_mouse_captured

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(is_mouse_captured)
	if is_mouse_captured:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
