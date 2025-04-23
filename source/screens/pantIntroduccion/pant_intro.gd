extends Node2D


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _ready():
	await get_tree().process_frame  # Espera un frame para estabilidad
	await get_tree().create_timer(5.0).timeout  # Espera 2 segundos
	SCN_T.cambia_escena("res://source/screens/pantPrincipal/pantPrin.tscn")
