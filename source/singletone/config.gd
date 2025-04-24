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
		config.set_value("Personaje","maxhealth",100)
		config.set_value("Personaje","basedamage",100)
		config.set_value("Personaje","taco",10)
		config.set_value("Personaje","pedigree",30)
		config.set_value("Personaje","nutrescan",20)
		config.set_value("Personaje","pedigree",30)
		config.set_value("Personaje","playername","")
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
