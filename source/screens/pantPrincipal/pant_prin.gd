extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_btn_iniciar_pressed() -> void:
	CRC_T.cambia_escena("res://source/screens/pantJuego/pantJuego.tscn")


func _on_button_pressed() -> void:
	SCN_T.cambia_escena("res://source/screens/pantConfiguracion/pantConfig.tscn")


func _on_btn_creditos_pressed() -> void:
	SCN_T.cambia_escena("res://source/screens/pantCreditos/pantCreditos.tscn")
	pass # Replace with function body.
