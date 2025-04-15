extends Node2D

@onready var per = $PersonajeA
var speed: int = 120

func _ready():
	per.animation = "caminar_derecha"

func _process(delta):
	var moving := false
	var direction := Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	if direction != Vector2.ZERO:
		moving = true
		direction = direction.normalized()
		per.position += direction * speed * delta

		# Animaciones según dirección
		if direction.y < 0:
			per.play("caminar_arriba")
		elif direction.y > 0:
			per.play("caminar_abajo")
		elif direction.x < 0:
			per.play("caminar_izquierda")
		elif direction.x > 0:
			per.play("caminar_derecha")
	else:
		per.stop()
		per.frame = 1  # Opcional: depende si tu sprite tiene un frame estático

# Este método no se usa en tu código, pero lo mantengo si lo necesitas más adelante.
func _input_2_keys(k1: String, k2: String) -> bool:
	return Input.is_action_pressed(k1) or Input.is_action_pressed(k2)
