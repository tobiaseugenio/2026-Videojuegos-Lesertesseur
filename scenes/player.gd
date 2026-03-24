extends CharacterBody2D

@export var speed:int = 750

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#posicion inicio:
	position = Vector2(100,100)	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	velocity.y=0
	var direccion = 0
	if(Input.is_action_pressed("rightArrowKey")):  
		direccion = 1
	elif(Input.is_action_pressed("leftArrowKey")):
		direccion = -1
	else:
		direccion=0
	velocity.x = direccion * speed
	move_and_slide()
