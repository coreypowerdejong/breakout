extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/HBoxContainer/MarginContainer/ScoreLabel.text = "SCORE: 0"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_score(score):
	$Control/HBoxContainer/MarginContainer/ScoreLabel.text = "SCORE: " + str(score)
