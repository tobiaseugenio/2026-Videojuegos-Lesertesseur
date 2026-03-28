extends Node2D

@onready var bloque_escena: PackedScene = preload("res://scenes/block.tscn")
@export var altura_bloque = 38
@export var separacion_y = 20
@export var cantBloquesFila = 12
@export var cantFilas = 3

func _ready():
	construirBloques()
		
func construirBloques():
	GameManager.bloquesRestantes = cantBloquesFila * cantFilas
	for i in range(cantFilas):
		generar_fila_de_bloques(cantBloquesFila, (altura_bloque + separacion_y)*i)

func reset():
	remove_child(get_node("."))
	construirBloques()
			
func generar_fila_de_bloques(cantidad: int, offset_y: int):
	var ancho_bloque = 95 
	var espacio = 0      
	var inicio_x = 100    
	var inicio_y = 100 + offset_y

	for i in range(cantidad):
		
		var nuevo_bloque = bloque_escena.instantiate()
		nuevo_bloque.position = Vector2(inicio_x + i * (ancho_bloque + espacio), inicio_y)
				
		nuevo_bloque.puntos = 50
		nuevo_bloque.resistencia = 1
		
		add_child(nuevo_bloque, true)
