extends Node2D

func _ready():
	get_viewport().audio_listener_enable_2d = true
	$AudioStreamPlayer2D.play()
