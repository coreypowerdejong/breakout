extends CharacterBody2D


const SPEED = 300.0

var on_paddle = true

func _ready():
	velocity = Vector2(300, 300)

 
func _physics_process(delta):
	
	if on_paddle:
		go_to_paddle()
		velocity = Vector2.ZERO
		if Input.is_action_pressed("launch_ball"):
			launch()
		return

	var collision: KinematicCollision2D = move_and_collide(delta * velocity)
	if collision:
		# Default collision (block, wall, ceiling)
		velocity = velocity.bounce(collision.get_normal())
		# Special case: paddle collision
		if collision.get_collider() == Paddle:
			var angle = calculate_bounce_angle()
			velocity = Vector2.from_angle(angle)*300

func reset():
	on_paddle = true
	go_to_paddle()

func launch():
	on_paddle = false
	velocity = Vector2.from_angle(randf_range(PI + 0.3, 2 * PI - 0.3)) * 300

func calculate_bounce_angle():
	var p_dist = global_position.x - Paddle.global_position.x
	var p_width = Paddle.width
	var angle = remap(p_dist, -p_width / 2, p_width / 2, PI, 2 * PI)
	return angle

func go_to_paddle():
	global_position = Paddle.global_position + Vector2(0, -60)
