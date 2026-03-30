extends Node2D

@onready var bloque_escena: PackedScene = preload("res://scenes/block.tscn")
@export var alturaBloque = 22
@export var separacion_y = 0
@export var anchoDeLimitesLaterales = 15
@export var margenDeLimitesLaterales = 100
@export var cantFilas = 4
@export var ancho_bloque = 80 
var posicionInicial_x = 0
var posicionInicial_y = 100

func _ready():
	GameManager.escenaBlocks = self
	construirBloques()
		
func construirBloques():
	var anchoDePantallaDisponible = get_viewport().size.x - (anchoDeLimitesLaterales * 2) - (margenDeLimitesLaterales * 2)
	var cantBloquesFila = anchoDePantallaDisponible / ancho_bloque
	var diferenciaPorRedondeo = (anchoDePantallaDisponible - (cantBloquesFila * ancho_bloque)) / 2
	posicionInicial_x = anchoDeLimitesLaterales + margenDeLimitesLaterales + diferenciaPorRedondeo

	GameManager.bloquesRestantes = cantBloquesFila * cantFilas
	for i in range(cantFilas):
		generar_fila_de_bloques(cantBloquesFila, (alturaBloque + separacion_y)*i)

func reset():
	remove_child(get_node("."))
	construirBloques()
			
func generar_fila_de_bloques(cantidad: int, offset_y: int):
	var espacio = 0      
	var inicio_x = posicionInicial_x
	var inicio_y = posicionInicial_y + offset_y

	for i in range(cantidad):
		
		var nuevo_bloque = bloque_escena.instantiate()
		nuevo_bloque.position = Vector2(inicio_x + i * (ancho_bloque + espacio), inicio_y)
				
		nuevo_bloque.puntos = 50
		nuevo_bloque.resistencia = 1
		
		add_child(nuevo_bloque, true)
