extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HBoxContainer/BtnContinuar.disabled= !FileAccess.file_exists("res://gamesaved.json")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func button_disabling(v:bool):
	$HBoxContainer/BtnComoJugar.disabled=v
	$HBoxContainer/BtnConfig.disabled=v
	$HBoxContainer/BtnContinuar.disabled=v
	$HBoxContainer/BtnCreditos.disabled=v
	$HBoxContainer/BtnIniciar.disabled=v
	$HBoxContainer/BtnSalir.disabled=v

func _on_btn_iniciar_pressed() -> void:
	CRC_T.cambia_escena("res://source/screens/pantJuego/pantJuego.tscn")
	


func _on_button_pressed() -> void:
	RECT_T.cambia_escena_rect("res://source/screens/pantConfiguracion/pantConfig.tscn")


func _on_btn_creditos_pressed() -> void:
	SCN_T.cambia_escena("res://source/screens/pantCreditos/pantCreditos.tscn")


func _on_btn_continuar_pressed() -> void:
	SAVEFILE.carga_partida()
	RECT_T.cambia_escena_curtain("res://source/screens/pantJuego/pantJuego.tscn")


func _on_btn_salir_pressed() -> void:
	button_disabling(true)
	get_tree().quit()
	pass # Replace with function body.
