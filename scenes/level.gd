extends Node2D

func _ready():
	var ancho_pantalla = get_viewport_rect().size.x
	var alto_pantalla = get_viewport_rect().size.y

	var spritePlayer = $player/Barra 
	var altoPlayer = spritePlayer.get_rect().size.y * spritePlayer.scale.y

	var spritePelota = $pelota/SpritePelota 
	var altoPelota = spritePelota.get_rect().size.y * spritePelota.scale.y
	
	$player.global_position.x = ancho_pantalla / 2.0
	$player.global_position.y = alto_pantalla - altoPlayer
	
	$pelota.global_position.x = ancho_pantalla / 2.0
	$pelota.global_position.y = alto_pantalla -(altoPlayer/2.0) - (altoPelota/2.0) - 20
	
