extends Sprite2D

var speed: int = 400
var angular_speed: float = PI

func _process(delta):
	turn(delta)
	move(delta)

func turn(delta):
	rotation += angular_speed * delta

func move(delta):
	var velocity: Vector2 = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta
