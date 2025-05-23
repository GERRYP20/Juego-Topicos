extends Control
const icoDario=preload("res://resources/imagenes/icons_bg/company1.png")
func _ready():
	pass
func _activar(TEXTO: String, IMAGE: Texture)-> void:
	$CanvasLayer.show();
	TEXTO=$CanvasLayer/Label.text;
	$CanvasLayer/TextureRect.texture=IMAGE;
	
func _process(delta):
	if (GDialogos.dario==true):
		_activar(GDialogos.npc1.cap1.pd[0],icoDario)

	
	
