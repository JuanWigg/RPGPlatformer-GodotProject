extends Node


func _on_izquierda_body_entered(body):
	if body.is_in_group("pelota"):
		body.gol()
		print("punto para la derecha")


func _on_derecha_body_entered(body):
	if body.is_in_group("pelota"):
		body.gol()
		print("punto para la izquierda")
