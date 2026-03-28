extends MarginContainer

# Called when the node enters the scene tree for the first time.
@onready var cantVidas = $VBoxContainer/HBoxVidas/CantVidas
@onready var cantPuntos = $VBoxContainer/HBoxPuntos/CantPuntos


func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cantVidas.text = str(GameManager.vidas)
	cantPuntos.text = str(GameManager.puntosAcumulados)


func _on_boton_continuar_pressed() -> void:
	GameManager.reiniciar()


func _on_boton_perdida_pressed() -> void:
	GameManager.reiniciar()
