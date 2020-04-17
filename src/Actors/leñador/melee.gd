extends Actor
var state_machine


func _ready():
	state_machine = $AnimationTree.get("parameters/playback")

	
	
func _on_Att1Hit_area_entered(area):
	if area.is_in_group("hurtbox"):
		area.take_damage(2)

func _on_Att2Hit_area_entered(area):
	if area.is_in_group("hurtbox"):
		area.take_damage(1)

	
func _physics_process(delta):

	var direction := get_direction()
	
	if Input.is_action_pressed("run"):
		var plus = Vector2(speed.x * 2, speed.y)
		velocity = calculate_move_velocity(velocity, direction, plus)
	else:
		velocity = calculate_move_velocity(velocity, direction, speed)	
	velocity = move_and_slide(velocity, FLOOR_NORMAL)
	if Input.is_action_just_pressed("attack1"):
		attack1()
	if Input.is_action_just_pressed("attack2"):
		attack2()

func get_direction() -> Vector2:
	var current = state_machine.get_current_node()
	var out = Vector2.ZERO
	out = Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), 0)
	if Input.is_action_just_pressed("jump") and is_on_floor():
		out.y = -1
	else:
		out.y = 1
	
	
	
	
	return out
	
	
func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2
	) -> Vector2:
		var new_velocity: = linear_velocity
		new_velocity.x = speed.x * direction.x
		new_velocity.y += gravity * get_physics_process_delta_time()
		if direction.y == -1.0:
			new_velocity.y = speed.y * direction.y
		
		if linear_velocity.length() == 0:
			state_machine.travel("idle")
		else:
			if speed.x>0 and speed.x<=150:
				state_machine.travel("walk")
			else:
				state_machine.travel("run")
		
		if direction.x != 0:
			$PlayerSprite.scale.x = direction.x
		
		if direction.y < 0:
			state_machine.travel("jump")
		elif direction.y > 0 and !is_on_floor():
			state_machine.travel("falling")
		return new_velocity


func hurt():
	state_machine.travel("hurt")
	
func death():
	state_machine.travel("death")
	set_physics_process(false)
	
func attack1():
	state_machine.travel("attack1")
	
func attack2():
	state_machine.travel("attack2")



