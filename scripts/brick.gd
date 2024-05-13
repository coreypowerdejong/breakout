extends StaticBody2D

signal block_broken


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	queue_free()
	emit_signal("block_broken")

func set_color(color):
	$ColorRect.set_color(color)

