
class_name BtnAMenuPrin extends Button


func _input(event):
	if event.is_action_pressed("ui_accept"):
		a_menu_prin()

func _on_pressed():
	a_menu_prin()


func a_menu_prin():
	SCN_T.cambia_escena("res://source/screens/pantPrincipal/pantPrin.tscn")
