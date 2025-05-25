extends Control

const icoDario = preload("res://resources/imagenes/dario.jpeg")
var dialogo_index := 0  # ← índice actual del diálogo

func _ready():
	$CanvasLayer.hide()

func _activar(texto: String, imagen: Texture) -> void:
	$CanvasLayer.show()
	$CanvasLayer/Label.text = texto
	$CanvasLayer/TextureRect.texture = imagen

func _process(delta):
	if GDialogos.dario:
		if dialogo_index < GDialogos.npc1.cap1.pd.size():
			_activar(GDialogos.npc1.cap1.pd[dialogo_index], icoDario)
		else:
			# Ya no hay más diálogos
			GDialogos.dario = false
			dialogo_index = 0
	else:
		$CanvasLayer.hide()

func _on_texture_button_button_down() -> void:
	if GDialogos.dario:
		dialogo_index += 1  # Avanza al siguiente diálogo
