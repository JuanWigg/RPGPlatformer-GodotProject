extends KinematicBody2D

var speed = 20
var direction = Vector2()

func _ready():
	randomize()
	set_start_position()

func _physics_process(delta):
	var colission = move_and_collide(direction * delta)
	if colission:
		direction = direction.bounce(colission.normal)
		if colission.collider.is_in_group("barras"):
			pass

func set_start_position():
	var rand_x = 1
	if randi()%10 <5:
		rand_x = -1
	direction = Vector2(rand_x,rand_range(-1,1))
	direction = direction.normalized() * speed
	
	

func gol():
	position = Vector2(16,16) 
	set_start_position()
