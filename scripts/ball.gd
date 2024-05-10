extends CharacterBody2D


const SPEED = 300.0

func _ready():
	velocity = Vector2(300, 300)

 
func _physics_process(delta):

	var collision: KinematicCollision2D = move_and_collide(delta * velocity)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

