'''
	Modulo ThreadLoader
	Creado por Emmanuel Morales Orihuela
	Fecha de Creación: 23 de mayo de 2025
	Fecha de Ultima Modificación 23 de mayo de 2025
	Descripción: Se implementa el cargador de hilos que agilizará la carga de videos
	en caso de que los haya.
	Se implementa en el _ready()
'''
extends Node

var scene
var scene_path:String
var thread = Thread.new()

func load_trigger(sp:String):
	if thread.is_alive():
		return
	scene_path = sp
	thread.start(load_scene)

func load_scene():
	scene = ResourceLoader.load(scene_path)
	
func get_scene()->PackedScene:
	return scene
