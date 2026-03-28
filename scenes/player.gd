extends CharacterBody2D

@export var speed:int = 750
@export var velocidad_lanzamiento := Vector2(0, -1)
@onready var pelota = $pelota
@onready var spritePelota = $pelota/SpritePelota 

var ancho_pantalla: float
var alto_pantalla: float
var alto_player: float
var pelota_lanzada := false

func _ready() -> void:
	var rect_viewport = get_viewport_rect().size
	ancho_pantalla = rect_viewport.x
	alto_pantalla = rect_viewport.y
	alto_player = $Barra.get_rect().size.y * $Barra.scale.y

	var altoPelota = spritePelota.get_rect().size.y * spritePelota.scale.y
	var separacionEnY = 5

	pelota.position.x = 0
	pelota.position.y = (-altoPelota / 2) - separacionEnY

func _physics_process(delta):
	var direccion = Input.get_axis("ui_left", "ui_right")
	velocity.x = direccion * 400
	move_and_slide()
	position.y = alto_pantalla - alto_player - 50
	
	if(not pelota_lanzada and Input.is_action_just_pressed("ui_accept")):
		lanzar_pelota()
		
func lanzar_pelota():
	pelota_lanzada = true
	
	var posicion_global = pelota.global_position
	pelota.get_parent().remove_child(pelota)
	get_parent().add_child(pelota)
	pelota.global_position = posicion_global

	pelota.freeze = false
	pelota.apply_central_impulse(velocidad_lanzamiento)
	
func reset():
	var ancho_pantalla = get_viewport_rect().size.x
	global_position.x = (ancho_pantalla / 2.0)	
