extends Button

func _ready() -> void:
	# Conecta la señal 'pressed' al método _on_pressed
	self.pressed.connect(_on_pressed)

func _on_pressed() -> void:
	get_tree().quit()
