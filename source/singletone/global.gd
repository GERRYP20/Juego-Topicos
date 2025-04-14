'''
	Modulo Global
	Creado por Emmanuel Morales Orihuela
	Fecha de Creación: 21 de febrero de 2025
	Fecha de Ultima Modificación 11 de Abril de 2025
	Descripción: Se implementa el repositorio de variables 
	globales del juego.
'''
extends Node
#enumerativos
##Markers es la indicación de cual punto de ingreso está
##establecido al cambiar de escena dentro del juego
##[br][color=lime]mk_game_start[/color] es la etiqueta para el mapa general
##[br][color=lime]mk_edit_t[/color] es la etiqueta para la entrada del edificio T
enum Markers {mk_game_start, mk_cafeteria}
#Declaración de variables globales del juego 
var speed:int
var maxhealth:int
var basedamage:int
var nutrescan:int
var pedigree:int
var playername:String

#variables de uso en el control de escenas
##Current_mark indica hacia qué escena se va a transicionar,
##aplica para las transiciones entre escenas del juego, es
##decir entre el mundo principal y los edificios.
var current_mark= Markers.mk_game_start
# Called when the node enters the scene tree for the first time.

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
	
