
class_name TransitionArea extends Area2D
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
