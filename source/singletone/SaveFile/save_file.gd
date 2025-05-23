'''
	Modulo SaveFile
	Creado por Rubén Dario Hernández Mendo
	Fecha de Creación: 13 de mayo de 2025
	Fecha de Ultima Modificación 14 de Mayo de 2025
	Descripción: SaveFile permite que el jugador pueda guardar su avance del juego. Este se carg0á si el jugador decide continuar una partida.
'''
extends Node2D

## Copia los datos relevantes del personaje durante la partida y los guarda en un archivo con formato json.
func salva_partida():
	var datos={
		"tophealth":	GLOBAL.tophealth,
		"curhealth":	GLOBAL.curhealth
	}
	var jsonString=JSON.stringify(datos)
	var jsonFile =FileAccess.open("res://gamesaved.json",FileAccess.WRITE)
	jsonFile.store_line(jsonString)
	jsonFile.close()
	print("Archivo Guardado")

##carga_partida recupera los datos almacenados en gamesaved.json y los copia a las variables de control correspondientes.	
func carga_partida():
	var jsonFile=FileAccess.open("res://gamesaved.json",FileAccess.READ)
	var jsonString=jsonFile.get_as_text()
	jsonFile.close()	
	var datos=JSON.parse_string(jsonString)
	GLOBAL.tophealth=datos.tophealth
	GLOBAL.curhealth=datos.curhealth
	print("Archivo Cargado")

##elimina_guardado elimina el archivo guardado, siempre y cuando este exista dentro del juego.
func elimina_guardado():	
	if FileAccess.file_exists("res://gamesaved.json"):
		DirAccess.remove_absolute("res://gamesaved.json")
