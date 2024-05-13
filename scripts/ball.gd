extends CharacterBody2D


const SPEED = 300.0

var on_paddle = true

func _ready():
	velocity = Vector2(300, 300)

 
func _physics_process(delta):
	
	if on_paddle:
		global_position = Paddle.global_position + Vector2(0, -60)
		velocity = Vector2.ZERO
		if Input.is_action_pressed("launch_ball"):
			launch()
		return

	var collision: KinematicCollision2D = move_and_collide(delta * velocity)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

func reset():
	on_paddle = true

func launch():
	on_paddle = false
	velocity = Vector2.from_angle(randf_range(0.3, PI - 0.3)) * 300
	
