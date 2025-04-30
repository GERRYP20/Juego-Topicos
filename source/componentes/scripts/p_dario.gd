
extends CharacterBody2D

@onready var sprite = $PDario

func _physics_process(delta):
	var is_moving = velocity.length() > 0.1

	if is_moving:
		pass
	else:
			sprite.play("nada")
	


func _on_area_2d_body_entered(body):
	if (body.is_in_group("interactuar")):
		GDialogos.dario=true;
		


func _on_area_2d_body_exited(body):
	if (body.is_in_group("interactuar")):
		GDialogos.dario=false;
