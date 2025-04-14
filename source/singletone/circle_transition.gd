'''
	Nodo CircleTransition
	Elaborado por: Emmanuel Morales Orihuela
	Fecha de Creación: 5 de marzo de 2024
	Fecha de Última Modificacion: 13 de abril de 2025
	Descripción: Permite la transición entre escenas pero agregando un
	efecto visual circular.
'''

extends CanvasLayer

func _ready() -> void:
	layer = -5

## La función cambia la escena actual por la escena indicada en el parámetro path, 
## haciendo una transición con ayuda de un shader circular que realiza una animación de círculo
## cerrándose y después de hacer la transición, realiza la misma animación pero en reversa. 
func cambia_escena(path:String):
	layer = 1
	$ANPTran.play("circle_in")
	await($ANPTran.animation_finished)
	get_tree().change_scene_to_file(path)
	$ANPTran.play_backwards("circle_in")
	await($ANPTran.animation_finished)
	layer = -5


## La función comienza la animación del personaje con el shader circular
## para que cambie de posición.
func mueve_personaje_in():
	layer = 1
	$ANPTran.play("circle_in")
	await($ANPTran.animation_finished)


## La función termina la animación del personaje con el shader circular
## para que cambie de posición.
func mueve_personaje_out():
	$ANPTran.play_backwards("circle_in")
	await($ANPTran.animation_finished)
	layer = -5
