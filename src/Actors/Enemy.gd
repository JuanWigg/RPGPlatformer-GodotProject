extends Actor
var state_machine
export var HP = 5;

func _ready():
	state_machine = $AnimationTree.get("parameters/playback")
	
	
func _physics_process(delta):
	velocity.y += gravity * get_physics_process_delta_time()
	velocity = move_and_slide(velocity, FLOOR_NORMAL)


func take_damage(dmg : int):
	state_machine.travel("hurt")
	HP -= dmg
	if HP <= 0:
		state_machine.travel("death")
		set_physics_process(false)
