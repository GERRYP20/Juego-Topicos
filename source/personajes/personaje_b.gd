extends CharacterBody2D

@onready var per = $PersonajeB
var speed: int = 200

func _process(delta):
	var direction := Vector2.ZERO

	# Movimiento con WASD y flechas
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1

	# Si se está moviendo
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		per.position += direction * speed * delta
		play_animation(direction)
	else:
		per.stop()
		per.frame = 1  # Opcional: frame estático

func play_animation(direction: Vector2):
	if abs(direction.x) > abs(direction.y):
		if direction.x < 0:
			per.play("caminar_izquierda")
		else:
			per.play("caminar_derecha")
	else:
		if direction.y < 0:
			per.play("caminar_arriba")
		else:
			per.play("caminar_abajo")
