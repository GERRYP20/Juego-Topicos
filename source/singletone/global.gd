'''
	Modulo Global
	Creado por Emmanuel Morales Orihuela
	Fecha de Creación: 21 de febrero de 2025
	Fecha de Ultima Modificación 11 de Abril de 2025
	Descripción: Se implementa el repositorio de variables 
	globales del juego.
'''
extends Node

#Declaración de variables globales del juego 
var speed:int
var maxhealth:int
var basedamage:int
var nutrescan:int
var pedigree:int
var playername:String

func _ready() -> void:
	#Carga de idioma activo
	var lenguaje_settings = CONFIG_FILE.load_lenguaje_setting()
	TranslationServer.set_locale(lenguaje_settings.lengua_activa)
	#Asignación de datos del personaje
	var personaje_settings = CONFIG_FILE.load_personaje_setting()
	speed = personaje_settings.speed
	maxhealth = personaje_settings.maxhealth
	basedamage = personaje_settings.basedamage
	nutrescan = personaje_settings.nutrescan
	pedigree = personaje_settings.pedigree
	playername = personaje_settings.playername
	
