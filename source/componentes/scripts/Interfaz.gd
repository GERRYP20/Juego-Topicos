extends Control

const icoDario = preload("res://resources/imagenes/dario.jpeg")

func _ready():
	$CanvasLayer.hide()

func _activar(texto: String, imagen: Texture) -> void:
	$CanvasLayer.show()
	$CanvasLayer/Label.text = texto
	$CanvasLayer/TextureRect.texture = imagen

func _process(delta):
	if GDialogos.dario:
		_activar(GDialogos.npc1.cap1.pd[0], icoDario)
	else:
		$CanvasLayer.hide()
