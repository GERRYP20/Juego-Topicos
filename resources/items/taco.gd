extends Area2D
signal recolecta
@onready var sprite = $AnimatedSprite2D
var velocity = Vector2.ZERO  # O la forma en que se actualice

func _physics_process(delta):
	var is_moving = velocity.length() > 0.1

	if is_moving:
		# por ejemplo: sprite.play("caminando")
		pass
	else:
		sprite.play("item")


func _on_body_entered(body):
	if body.is_in_group("Jugador"):
		emit_signal("recolecta")
		queue_free()
