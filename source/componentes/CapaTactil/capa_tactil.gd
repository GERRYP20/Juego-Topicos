'''
	Modulo CapaTactil
	Creado por Emmanuel Morales Orihuela 
	Fecha de Creación: 18 de mayo de 2025
	Fecha de Ultima Modificación 19 de Mayo de 2025
	Descripción: Capa tactil implementa una capa de controles para dispositivos móviles, por medio de toques a la pantalla.
'''
class_name CapaTactil extends CanvasLayer
@export var capa_visible:bool = true

func _ready():
	layer = -6

func toggle_visible():
	layer= 1 if capa_visible else -5

func activa_capa_tactil():
	if GLOBAL.touch_controls:
		capa_visible=true
		touch_buttons_setting(true)
		toggle_visible()

func desactiva_capa_tactil():
	print("Desactivando capa tactil")
	if GLOBAL.touch_controls:
		capa_visible=false
		touch_buttons_setting(false)
		toggle_visible()
				
func touch_buttons_setting(v:bool):
		$Pad/TSBDown.set_block_signals(v)
		$Pad/TSBUp.set_block_signals(v)
		$Pad/TSBRight.set_block_signals(v)
		$Pad/TSBLeft.set_block_signals(v)
		$Botones/TSB_A.set_block_signals(v)
		$Botones/TSB_B.set_block_signals(v)
		$Botones/TSB_X.set_block_signals(v)
		$Botones/TSB_Y.set_block_signals(v)
		$Control/TSB_Back.set_block_signals(v)
		$Control/TSB_Start.set_block_signals(v)
		#$Triggers/TSB_LB.set_block_signals(v)
		#$Triggers/TSB_LT.set_block_signals(v)
		#$Triggers/TSB_RB.set_block_signals(v)
		#$Triggers/TSB_RT.set_block_signals(v)
	
