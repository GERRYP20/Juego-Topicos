'''
	Nodo que ayuda con la transición de escenas pero con animación entre ellas.
'''

extends CanvasLayer

func _ready() -> void:
	layer = -5
	print_tree()
	

func cambia_escena(path:String):
	layer = 1
	$ANPFade.play("fade_in")
	await($ANPFade.animation_finished)
	get_tree().change_scene_to_file(path)
	$ANPFade.play_backwards("fade_in")
	await($ANPFade.animation_finished)
	layer=-5
