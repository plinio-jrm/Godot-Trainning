extends Sprite2D

var speed: int = 400
var angular_speed: float = PI

var input_direction: int = 0
var input_movement: Vector2 = Vector2.ZERO

func _process(delta):
	HandleInputs()
	Turn(delta)
	Move(delta)

func HandleInputs():
	input_direction = 0
	if Input.is_action_pressed("ui_left"):
		input_direction = -1
	if Input.is_action_pressed("ui_right"):
		input_direction = 1
	
	input_movement = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		input_movement = Vector2.UP.rotated(rotation)
	if Input.is_action_pressed("ui_down"):
		input_movement = Vector2.DOWN.rotated(rotation)

func Turn(delta):
	rotation += angular_speed * delta * input_direction

func Move(delta):
	var velocity: Vector2 = input_movement * speed
	position += velocity * delta

func _on_button_pressed():
	set_process(not is_processing())
