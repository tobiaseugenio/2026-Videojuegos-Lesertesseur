extends CharacterBody2D

@export var speed:int = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#posicion inicio:
	position = Vector2(1,500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	if(Input.is_action_pressed("rightArrowKey")):  
		#position += Vector2(1,0) * speed * delta
		velocity += Vector2(1,0) * speed * delta
		move_and_slide()
	if(Input.is_action_pressed("leftArrowKey")):
		position += Vector2(1,0) * -speed * delta
		move_and_slide()
	print(position)
