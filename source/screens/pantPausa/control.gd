extends Control

func _ready() -> void:
	$AnimationPlayer.play("RESET")
	hide()


func _process(delta: float) -> void:
	test_input()


func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	CAPA_TACTIL.activa_capa_tactil()
	hide()


func pause():
	CAPA_TACTIL.desactiva_capa_tactil()
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	show()


func test_input():
	if Input.is_action_just_pressed("pausa") and get_tree().paused == false:
		print("Entrando a pausa")
		pause()
	elif Input.is_action_just_pressed("pausa") and get_tree().paused == true:
		resume()


func _on_btn_continuar_pressed() -> void:
	resume()


func _on_btn_guardar_pressed() -> void:
	SAVEFILE.salva_partida()
	print("Partida guardada")


func _on_btn_a_menu_prin_pressed() -> void:
	resume()
	CAPA_TACTIL.desactiva_capa_tactil()
	SCN_T.cambia_escena("res://source/screens/pantPrincipal/pantPrin.tscn")
