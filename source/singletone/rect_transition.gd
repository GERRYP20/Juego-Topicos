'''
	Nodo RectTransition
	Elaborado por: Emmanuel Morales Orihuela
	Fecha de Creación: 20 de abril de 2024
	Fecha de Última Modificacion: 23 de abril de 2025
	Descripción: Permite la transición entre escenas pero agregando un
	efecto de telón o un efecto rectangular.
'''

extends CanvasLayer

func _ready() -> void:
	layer = -5

## La función cambia la escena actual por la escena indicada en el parámetro path, 
## haciendo una transición con ayuda de un shader circular que realiza una animación de círculo
## cerrándose y después de hacer la transición, realiza la misma animación pero en reversa. 
func cambia_escena_rect(path:String):
	layer = 1
	$ANPTran.play("rect_in")
	await($ANPTran.animation_finished)
	get_tree().change_scene_to_file(path)
	$ANPTran.play_backwards("rect_in")
	await($ANPTran.animation_finished)
	layer = -5


func cambia_escena_curtain(path:String):
	layer = 1
	$ANPTran.play("close_curtain")
	await($ANPTran.animation_finished)
	get_tree().change_scene_to_file(path)
	$ANPTran.play_backwards("close_curtain")
	await($ANPTran.animation_finished)
	layer = -5
