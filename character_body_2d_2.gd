extends CharacterBody2D

@onready var _ray_cast =$RayCast2D
const SPEED = -250.0
var velocidad = SPEED
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if _ray_cast.is_colliding():
		velocity.x =SPEED*2
	else :	
		velocity.x = SPEED


	move_and_slide()


func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.name == "Jugador":
		queue_free()


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.name == "Jugador":
		print("Has perdido")
		get_tree().quit()
