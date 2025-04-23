extends Node2D

var tacos=0
func _on_taco_recolecta():
	tacos+=1
	get_node("CanvasLayer/Label").text=": " + str(tacos)
