extends Area2D

export var velocity = 10
var vec = Vector2()

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	vec.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	position.y = position.y + vec.y
	
	pass
