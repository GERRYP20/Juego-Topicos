extends Button


func _input(event):
	if event.is_action_pressed("ui_accept"):
		a_pant_juego()

func _on_pressed():
	a_pant_juego()


func a_pant_juego():
	SCN_T.cambia_escena("res://source/screens/pantJuego/pantJuego.tscn")
