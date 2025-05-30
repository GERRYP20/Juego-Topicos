extends Area2D
signal recolecta

@onready var sprite = $AnimatedSprite2D
@onready var sonido = $comer  # ← Nodo de sonid


var velocity = Vector2.ZERO

func _physics_process(delta):
	var is_moving = velocity.length() > 0.1
	if is_moving:
		pass
	else:
		sprite.play("item")

func _on_body_entered(body):
	if body.is_in_group("Jugador"):
		emit_signal("recolecta")
		sonido.play()  # ← Reproducir sonido
		await get_tree().create_timer(0.1).timeout  # Pequeño retraso para que suene
		queue_free()
