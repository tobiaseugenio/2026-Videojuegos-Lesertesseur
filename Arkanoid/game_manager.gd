extends Node

var vidas:int = 3
var puntosAcumulados:int = 0
var bloquesRestantes:int = -1
#@onready var menuReinicio = $"/root/Level/Control/CanvasLayer/FinalPartida"
#@onready var menuPerdido = $"/root/Level/Control/CanvasLayer/PartidaPerdida"
#@onready var escenaPrincipal = $"/root/Level"
#@onready var escenaBlocks = $"/root/Level/Blocks"
#@onready var escenaPlayer = $"/root/Level/player"
var menuReinicio
var menuPerdido 
var escenaPrincipal
var escenaBlocks
var escenaPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(bloquesRestantes == 0):
		mostrarMenuReinicio()
	if(vidas == 0):
		await get_tree().process_frame
		mostrarMenuPartidaPerdida()	
	
func incrementarPuntos(puntos: int):
	puntosAcumulados += puntos;
	
func decrementarVidas():
	if(vidas > 0):
		vidas -= 1;

func decrementarBloquesRestantes():
	if(bloquesRestantes > 0):
		bloquesRestantes -= 1;

func mostrarMenuReinicio():
	menuReinicio.visible = true
	get_tree().paused = true
	
func mostrarMenuPartidaPerdida():
	menuPerdido.visible = true
	get_tree().paused = true

func reiniciar():
	escenaBlocks.reset()
	escenaPrincipal.resetPelota()
	vidas = 3
	puntosAcumulados = 0
	escenaPlayer.reset()
	menuReinicio.visible = false
	menuPerdido.visible = false
	get_tree().paused = false
	
