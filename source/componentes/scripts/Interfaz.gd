extends Control

const icoDario = preload("res://resources/imagenes/dario.jpeg")
const icoGustavo = preload("res://resources/imagenes/personajes/icongustavo.png")
const icoAlan = preload("res://resources/imagenes/personajes/iconalan.png")

var dialogo_index := 0
var escribiendo := false
var texto_actual := ""  # guarda el texto actual para no reactivar

func _ready():
	$CanvasLayer.hide()

func _activar(texto: String, imagen: Texture) -> void:
	$CanvasLayer.show()
	$CanvasLayer/TextureRect.texture = imagen
	_escribir_texto(texto)

func _escribir_texto(texto: String) -> void:
	escribiendo = true
	$text.play()
	texto_actual = texto
	$CanvasLayer/Label.text = ""
	call_deferred("_mostrar_letra_por_letra", texto)

func _mostrar_letra_por_letra(texto: String) -> void:
	for i in texto.length():
		$CanvasLayer/Label.text += texto[i]
		await get_tree().create_timer(0.03).timeout
	escribiendo = false
	$text.stop()

func _process(_delta):
	if GDialogos.dario:
		var nuevo_texto = GDialogos.npc1.cap1.pd[dialogo_index]
		if not escribiendo and texto_actual != nuevo_texto:
			_activar(nuevo_texto, icoDario)
		$CanvasLayer.show()
	elif GDialogos.gustavo:
		var nuevo_texto = GDialogos.npc2.cap1.pd[dialogo_index]
		if not escribiendo and texto_actual != nuevo_texto:
			_activar(nuevo_texto, icoGustavo)
		$CanvasLayer.show()
	elif GDialogos.alan:
		var nuevo_texto = GDialogos.npc3.cap1.pd[dialogo_index]
		if not escribiendo and texto_actual != nuevo_texto:
			_activar(nuevo_texto, icoAlan)
		$CanvasLayer.show()
	else:
		$CanvasLayer.hide()

func _on_texture_button_button_down() -> void:
	if GDialogos.dario:
		if escribiendo:
			terminar_texto_inmediatamente(GDialogos.npc1.cap1.pd)
		else:
			dialogo_index += 1
			if dialogo_index >= GDialogos.npc1.cap1.pd.size():
				GDialogos.dario = false
				dialogo_index = 0
	elif GDialogos.gustavo:
		if escribiendo:
			terminar_texto_inmediatamente(GDialogos.npc2.cap1.pd)
		else:
			dialogo_index += 1
			if dialogo_index >= GDialogos.npc2.cap1.pd.size():
				GDialogos.gustavo = false
				dialogo_index = 0
	elif GDialogos.alan:
		if escribiendo:
			terminar_texto_inmediatamente(GDialogos.npc3.cap1.pd)
		else:
			dialogo_index += 1
			if dialogo_index >= GDialogos.npc3.cap1.pd.size():
				GDialogos.alan = false
				dialogo_index = 0

func terminar_texto_inmediatamente(dialogos):
	var texto_completo = dialogos[dialogo_index]
	$CanvasLayer/Label.text = texto_completo
	texto_actual = texto_completo
	escribiendo = false
