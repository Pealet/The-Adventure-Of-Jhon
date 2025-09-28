extends CharacterBody2D

@export var speed: float = 1000
func _physics_process(delta: float) -> void:
	velocity = transform.x * 1000
	move_and_slide()
	
