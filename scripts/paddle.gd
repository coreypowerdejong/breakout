extends CharacterBody2D


const SPEED = 500.0

@onready var width = $ColorRect.size.x

func _ready():
	reset()

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	var block_left = $LeftChecker.has_overlapping_bodies()
	var block_right = $RightChecker.has_overlapping_bodies()
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if block_left and velocity.x < 0:
		velocity.x = 0
	if block_right and velocity.x > 0:
		velocity.x = 0
	move_and_collide(delta * velocity)

func reset():
	global_position = Vector2(640, 590)
