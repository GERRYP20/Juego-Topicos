class_name Pausa
extends CanvasLayer

var on_pause: bool = false

func _ready() -> void:
	layer = -5

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("pausa"):
		_input_process()
	if Input.is_action_just_pressed("click"):
		if get_viewport().gui_get_focus_owner() and get_viewport().gui_get_focus_owner().name == "BtnAMenuPrincipal":
			CAPA_TACTIL.desactiva_capa_tactil()
			_input_process()
			$ClrFondo/HB/BtnAMenuPrincipal._on_pressed()

func _input_process() -> void:
	on_pause = !on_pause
	get_tree().paused = !get_tree().paused
	print("En Pausa" if on_pause else "Fuera de Pausa")
	layer = 1
	$ClrFondo.visible = !$ClrFondo.visible

	if $ClrFondo.visible:
		if GLOBAL.touch_controls:
			CAPA_TACTIL.desactiva_capa_tactil()
		$ClrFondo/HB/BtnContinuar.grab_focus()
		$ASPPausa.play()
	else:
		if GLOBAL.touch_controls:
			CAPA_TACTIL.activa_capa_tactil()
		$ASPPausa.stop()

func _on_btn_continuar_pressed() -> void:
	_input_process()

func _on_btn_save_pressed() -> void:
	SAVEFILE.salva_partida()
