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
var speed:int			##speed velocidad normal del personaje
var maxhealth:int		##maxhealth salud máxima absoluta del personaje
var tophealth:int=3		##tophealth salud máxima inicial
var curhealth:int=3		##curhealth salud actual inicial
var basedamage:int		##basedamage daño base del personaje
var taco:int			##cantidad de salud por taco
var pedigree:int		##cantidad de salud por pedigree
var playername:String	##playername nombre del jugador
var enemigot_vel:float	## velocidad de los enemigos terrestres
var enemigot_damage:float ##daño de enemigo terrestre
var mstvol:float		##volumen maestro
var mscvol:float		##volumen de la música
var sfxvol:float		##volumen de los efectos de sonido
var voivol:float		##volumen de las voces
var touch_controls:bool ##controles tactiles activos

#variables de uso en el control de escenas
##Current_mark indica hacia qué escena se va a transicionar,
##aplica para las transiciones entre escenas del juego, es
##decir entre el mundo principal y los edificios.
var current_mark= Markers.mk_game_start

##variables que indican la posesión de items dentro del juego,se reinician cada vez que el jugador elige la opción Iniciar Juego, en caso de elegir Continuar partida se mantendrán los items ya adquiridos
var player_has_lamp:bool ##indica si el jugador ya cuenta con la linterna
var active_item:int		##indica el item activo del jugador
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	#Carga de idioma activo
	var lenguaje_settings = CONFIG_FILE.load_lenguaje_setting()
	TranslationServer.set_locale(lenguaje_settings.lengua_activa)
	#Asignación de datos del personaje
	var personaje_settings = CONFIG_FILE.load_personaje_setting()
	speed = personaje_settings.speed
	maxhealth = personaje_settings.maxhealth
	curhealth = personaje_settings.curhealth
	tophealth = personaje_settings.tophealth
	basedamage = personaje_settings.basedamage
	taco = personaje_settings.taco
	pedigree = personaje_settings.pedigree
	playername = personaje_settings.playername
	# Asignación de valores para enemigo
	var enemigot_setting=CONFIG_FILE.load_enemigot_setting()
	enemigot_vel=enemigot_setting.velocidad
	enemigot_damage = enemigot_setting.damage
	# Asignación de valores de volumen
	var audio_setting=CONFIG_FILE.load_audio_setting()
	mstvol=audio_setting.mstvol
	mscvol=audio_setting.mscvol
	sfxvol=audio_setting.sfxvol
	voivol=audio_setting.voivol
	# Asignación valores controles táctiles
	var touch_setting=CONFIG_FILE.load_touch_setting()
	touch_controls=touch_setting.touch_controls

func set_bus_volume(bus,volume):
	AudioServer.set_bus_volume_db(bus,linear_to_db(volume))
	AudioServer.set_bus_mute(bus,volume<0.05)
