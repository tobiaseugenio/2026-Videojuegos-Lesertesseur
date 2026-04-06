extends RigidBody2D

@export var velocidad_constante := 400.0

func _ready():
	body_entered.connect(_on_body_entered)

func _physics_process(_delta):
	linear_velocity = linear_velocity.normalized() * velocidad_constante

func _on_body_entered(body):
	if body is CharacterBody2D:
		var diferencia_x = global_position.x - body.global_position.x
		var ancho_barra = body.get_node("collisionPlayer").shape.get_rect().size.x
		var factor_influencia = diferencia_x / (ancho_barra / 2)
		var nueva_direccion = Vector2(factor_influencia, -1).normalized()

		linear_velocity = nueva_direccion * velocidad_constante
	elif(body.name.begins_with("Block")):
		if(body.resistencia > 1):
			body.resistencia -= 1
		else:
			body.get_parent().remove_child(body)
			await get_tree().process_frame
			GameManager.incrementarPuntos(body.puntos)
			GameManager.decrementarBloquesRestantes()
