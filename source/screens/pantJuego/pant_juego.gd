extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GLOBAL.touch_controls:
		CAPA_TACTIL.activa_capa_tactil()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
