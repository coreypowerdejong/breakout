extends Node2D

var brick_scene = load("res://scenes/brick.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, 16):
		for j in 8:
			var brick = brick_scene.instantiate()
			brick.global_position = Vector2( 1280 / 32 + i*1280/16, 20 + j*40)
			add_child(brick)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
