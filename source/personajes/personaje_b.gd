class_name Personaje
extends CharacterBody2D

@onready var per = $PersonajeB
var base_speed: int = 250
var run_multiplier: float = 1.5  # Aumento de velocidad al correr

func _process(delta):
	var direction := Vector2.ZERO

	# Movimiento del personaje según teclas presionadas
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1

	if direction != Vector2.ZERO:
		direction = direction.normalized()
		
		# Verifica si Shift está presionado para aumentar la velocidad
		var current_speed = base_speed
		if Input.is_key_pressed(KEY_SHIFT):
			current_speed *= run_multiplier

		velocity = direction * current_speed
		play_animation(direction)
		_set_collision_from_vector(direction)  # Activar/desactivar colisiones según dirección
	else:
		velocity = Vector2.ZERO
		per.stop()
		per.frame = 1

	move_and_slide()

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

func _set_collision_from_vector(direction: Vector2):
	if abs(direction.x) > abs(direction.y):
		if direction.x < 0:
			_set_collision("move_left")
		else:
			_set_collision("move_right")
	else:
		if direction.y < 0:
			_set_collision("move_up")
		else:
			_set_collision("move_down")

# Activa solo una colisión dependiendo de la dirección
func _set_collision(direction: String):
	$CollisionShapeUp.disabled = (direction != "move_up")
	$CollisionShapeDown.disabled = (direction != "move_down")
	$CollisionShapeLeft.disabled = (direction != "move_left")
	$CollisionShapeRight.disabled = (direction != "move_right")


func _on_btn_pausa_pressed() -> void:
	Input.action_press("pausa")
