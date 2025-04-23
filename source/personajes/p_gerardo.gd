
extends CharacterBody2D

@onready var sprite = $PGerardo

func _physics_process(delta):
	var is_moving = velocity.length() > 0.1

	if is_moving:
		pass
	else:
			sprite.play("nada")
