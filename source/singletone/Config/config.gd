'''
	Modulo Config
	Creado por Emmanuel Morales Orihuela
	Fecha de Creación: 02 de abril de 2025
	Fecha de Ultima Modificación 02 de abril de 2025
	Descripción: Se implementa el archivo de configuración para el
	juego, en él se cargarán datos relevantes que controlarán
	diversos aspectos del juego.
'''

extends Node

var file_path = "res://config.cfg"
var config = ConfigFile.new()

func _ready() -> void:
	if not FileAccess.file_exists(file_path):
		# Sección Lenguaje
		config.set_value("Lenguaje","lengua_activa", "es")
		
		# Sección propiedades personaje
		config.set_value("Personaje","speed",100)
		config.set_value("Personaje","maxhealth",500)
		config.set_value("Personaje","curhealth",100)
		config.set_value("Personaje","tophealth",100)
		config.set_value("Personaje","basedamage",100)
		config.set_value("Personaje","taco",10)
		config.set_value("Personaje","pedigree",30)
		config.set_value("Personaje","nutrescan",20)
		config.set_value("Personaje","pedigree",30)
		config.set_value("Personaje","playername","")
		config.set_value("EnemigoT","velocidad",50.0)
		config.set_value("EnemigoT","damage",20.0)
		config.set_value("Audio","mscvol",0.7)
		config.set_value("Audio","sfxvol",0.7)
		config.set_value("Audio","voivol",0.7)
		config.set_value("Audio","mstvol",1.0)
		config.set_value("Touch","touch_controls",false)
		config.save(file_path)
		print("Archivo config.cfg creado")
	else:
		config.load(file_path)
		print("Archivo config.cfg cargado")

func save_full_config():
	config.save(file_path)

# Sección Lenguaje
func save_lenguaje_setting(key:String, value):
	config.set_value("Lenguaje",key,value)
	config.save(file_path)

func update_lenguaje_setting(key:String, value):
	config.set_value("Lenguaje", key, value)

func load_lenguaje_setting():
	var lenguaje_settings = {}
	for key in config.get_section_keys("Lenguaje"):
		lenguaje_settings[key] =config.get_value("Lenguaje", key)
	return lenguaje_settings

#SECCION Personaje
func save_personaje_setting(key:String, value):
	config.set_value("Personaje",key,value)
	config.save(file_path)
	
func update_personaje_setting(key:String, value):
	config.set_value("Personaje",key,value)
	
func load_personaje_setting():
	var personaje_settings= {}
	for key in config.get_section_keys("Personaje"):
		personaje_settings[key]=config.get_value("Personaje",key)
	return personaje_settings

# SECCIÓN ENEMIGO
func save_enemigot_setting(key:String, value):
	config.set_value("EnemigoT",key,value)
	config.save(file_path)
	
func update_enemigot_setting(key:String, value):
	config.set_value("EnemigoT",key,value)
	
func load_enemigot_setting():
	var enemigot_settings= {}
	for key in config.get_section_keys("EnemigoT"):
		enemigot_settings[key]=config.get_value("EnemigoT",key)
	return enemigot_settings

#SECCION Audio
func save_audio_setting(key:String, value):
	config.set_value("Audio",key,value)
	config.save(file_path)
	
func update_audio_setting(key:String, value):
	config.set_value("Audio",key,value)
	
func load_audio_setting():
	var audio_settings= {}
	for key in config.get_section_keys("Audio"):
		audio_settings[key]=config.get_value("Audio",key)
	return audio_settings

#SECCION Touch
func save_touch_setting(key:String, value):
	config.set_value("Touch",key,value)
	config.save(file_path)
	
func update_touch_setting(key:String, value):
	config.set_value("Touch",key,value)
	
func load_touch_setting():
	var touch_settings= {}
	for key in config.get_section_keys("Touch"):
		touch_settings[key]=config.get_value("Touch",key)
	return touch_settings
