'''
	Módulo Config
	Creado por Emmanuel Morales Orihuela
	Fecha de creación 02 de abril de 2025
	Fecha de ultima modificación 02 de abril de 2025
	Descripción: Se implementa la pantalla de configuración
	del juego.
'''

class_name PantConfig extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func language_control():	
	print("Language control")
	var lenguaje_settings=CONFIG_FILE.load_lenguaje_setting()
	var al=lenguaje_settings.lengua_activa
	al= "es" if al=="en" else "en"
	CONFIG_FILE.update_lenguaje_setting("lengua_activa",al)
	TranslationServer.set_locale(al)


func _on_btn_cambiar_idioma_pressed() -> void:
	language_control()


func _on_btn_guardar_pressed() -> void:
	CONFIG_FILE.save_full_config()
