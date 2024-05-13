extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/HBoxContainer/MarginContainer/ScoreLabel.text = "SCORE: 0"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_score(score):
	$Control/HBoxContainer/MarginContainer/ScoreLabel.text = "SCORE: " + str(score)

func update_lives(lives):
	$Control/HBoxContainer/MarginContainer2/LivesLabel.text = "LIVES: " + str(lives)

func game_over():
	$Control/StartButton.show()


func start_game():
	$Control/StartButton.hide()
