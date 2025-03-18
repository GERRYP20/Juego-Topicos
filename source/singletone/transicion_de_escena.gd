'''
efecto visual de cambiar de escena
'''
extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	layer=-5

func cambia_escena(path:String):
	layer=1
	$ANPFade.play("fade_in")
	await($ANPFade.animation_finished)
	get_tree().change_scene_to_file(path)
	$ANPFade.play_backwards("fade_in")
	await($ANPFade.animation_finished)
	layer=-5
