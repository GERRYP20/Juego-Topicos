extends Node

var dario: bool = false
var gustavo: bool= false
var alan: bool =false

const npc1: Dictionary = {
	'cap1': {
		'pd': [
			"Dario: ¡HOLA RAYAS! MI NOMBRE ES DARIO",
			"Dario: ¿QUÉ HACES POR AQUÍ?",
			"Dario: SE VE QUE TIENES HAMBRE",
			"Dario: DEBERÍAS IR A LA CAFETERIA",
			"Dario: AHÍ PUEDE QUE ENCUENTRES COMIDA",
			"Dario: ¡PERO TEN CUIDADO CON LOS GUARDIAS!",
			"Dario: NO LES GUSTAN LOS PERROS"
		]
	}
}

const npc2: Dictionary = {
	'cap1': {
		'pd': [
			"Guss: Hola, mi nombre es gustavo",
			"Guss: Las malteadas de este lugar son fabulosas"
		]
	}
}

const npc3: Dictionary = {
	'cap1': {
		'pd': [
			"Alan: El tec es mi casa",
			"Alan: ¿Mi pasatiempo?",
			"Alan: Estudiar, sin duda alguna"
		]
	}
}
func _ready():
	pass
