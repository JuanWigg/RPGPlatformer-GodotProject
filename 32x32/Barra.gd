extends KinematicBody2D

export var velocity = 100
var vec = Vector2()

func _ready():
	vec = Vector2(0,0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	vec.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	vec = move_and_slide(vec * velocity)
	
