extends Area2D

func take_damage(dmg: int):
	get_parent().take_damage(dmg)
