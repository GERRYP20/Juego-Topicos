
extends CharacterBody2D

@onready var sprite = $PAlan

func _physics_process(delta):
	var is_moving = velocity.length() > 0.1

	if is_moving:
		pass
	else:
			sprite.play("nada")

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("interactuar"):
		GDialogos.alan = true

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("interactuar"):
		GDialogos.alan = false
