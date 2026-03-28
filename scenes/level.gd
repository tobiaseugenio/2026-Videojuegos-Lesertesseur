extends Node2D

@onready var player = $player
@onready var spritePlayer = $player/Barra 
@export var puntosGanados:int = 0
@export var vidasRestantes:int = 3

func _ready():
	var ancho_pantalla = get_viewport_rect().size.x
	$player.global_position.x = (ancho_pantalla / 2.0)
	$Control/CanvasLayer/FinalPartida.visible=false
	$Control/CanvasLayer/PartidaPerdida.visible=false
	
func resetPelota():
	var pelota = $pelota
	if(pelota != null):
		pelota.freeze = true
		pelota.linear_velocity = Vector2.ZERO
		
		if pelota.get_parent() != player:
			pelota.get_parent().remove_child(pelota)
			player.add_child(pelota)

		pelota.position = Vector2(0, -20)
		player.pelota_lanzada = false 
		GameManager.decrementarVidas()

func _on_zona_reset_body_entered(body: Node2D) -> void:
	if body.name == "pelota": 
		resetPelota()
