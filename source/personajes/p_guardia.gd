extends CharacterBody2D

# Referencia al Area2D del jugador detectado
var area_jugador: Area2D = null

# Velocidad de movimiento
var vel := 150.0

func _physics_process(delta):
	if area_jugador and area_jugador.is_inside_tree():
		var direccion = (area_jugador.global_position - global_position).normalized()
		print("Pos enemigo:", global_position, "Pos jugador:", area_jugador.global_position, "Dir:", direccion)
		
		# Usa esta línea para que se mueva hacia el jugador:
		velocity = direccion * vel
		
		# Si ves que escapa hacia la izquierda, comenta la línea anterior y descomenta esta:
		# velocity = -direccion * vel
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Jugador"):
		area_jugador = area
		print("Área del jugador detectada:", area.name)

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area == area_jugador:
		area_jugador = null
		print("Área del jugador salió")
