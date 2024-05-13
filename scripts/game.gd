extends Node2D

var brick_scene = load("res://scenes/brick.tscn")
var score: int = 0
var lives: int = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_game()
	build_bricks()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_brick_broken():
	score += 1
	$HUD.update_score(score)
	$Ball.increase_speed()
	var total_bricks = len(get_tree().get_nodes_in_group("bricks"))
	if total_bricks == 1:
		win()

func _on_endzone_body_entered(body):
	$Ball.reset()
	lives -= 1
	$HUD.update_lives(lives)
	if lives == 0:
		game_over()


func game_over():
	get_tree().paused = true
	$HUD.game_over()


func win():
	get_tree().paused = true
	$HUD.win()


func _on_start_button_pressed():
	reset_game()
	get_tree().paused = false


func reset_game():
	Paddle.reset()
	$Ball.reset()
	build_bricks()
	lives = 3
	$HUD.update_lives(lives)
	score = 0
	$HUD.update_score(score)
	$HUD.start_game()

func build_bricks(rows = 9, columns = 16):
	get_tree().call_group("bricks", "queue_free")
	var colors = ["tomato", "lawngreen", "dodgerblue"]
	for i in columns:
		for j in rows:
			var brick = brick_scene.instantiate()
			var spacing = 1280/columns
			brick.global_position = Vector2(spacing/2 + i*spacing, 20 + j*25)
			brick.set_color(colors[j % 3])
			brick.block_broken.connect(_on_brick_broken)
			brick.add_to_group("bricks")
			add_child(brick)
