
## TransitionArea indica una zona del mapa que servirá para cambiar a 
##otra escena, esto es cuando se entre o salga de un edificio
class_name TransitionArea extends Area2D
## Scene es la ruta, en formato de cadena, a la escena a la que
## queremos cambiar.
@export var scene:String
signal scene_change

func _ready():
	pass


func _on_body_entered(body):
	if body is Personaje:
		emit_signal("scene_change")
		SCN_T.cambia_escena(scene)

func set_scene(s:String):
	scene=s
