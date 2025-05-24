extends CharacterBody2D

var area_jugador: Area2D = null
var vel := 150.0
var posicion_ant: Vector2

func _ready():
	posicion_ant = position

func _physics_process(delta):
	if area_jugador and area_jugador.is_inside_tree():
		var direccion = (area_jugador.global_position - global_position).normalized()
		
		# Movimiento real hacia el jugador
		position += direccion * vel * delta
		
		_actualizar_animacion(direccion)
		posicion_ant = position
	else:
		$AnimatedSprite2D.play("idle")

func _actualizar_animacion(direccion: Vector2):
	if direccion.length() < 0.01:
		$AnimatedSprite2D.play("idle")
		return

	if abs(direccion.x) > abs(direccion.y):
		if direccion.x > 0:
			$AnimatedSprite2D.play("camina_derecha")
		else:
			$AnimatedSprite2D.play("camina_izquierda")
	else:
		if direccion.y > 0:
			$AnimatedSprite2D.play("caminando_abajo")
		else:
			$AnimatedSprite2D.play("caminando_arriba")

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Jugador"):
		area_jugador = area
		print("Área del jugador detectada:", area.name)

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area == area_jugador:
		area_jugador = null
		print("Área del jugador salió")
