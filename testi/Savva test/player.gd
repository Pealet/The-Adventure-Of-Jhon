extends CharacterBody2D

var Bullet = preload("res://Savva test/Bullet.tscn")
@export var speed = 400

var active_marker: Marker2D
func _ready():
	active_marker = $ScopeDown

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
func _physics_process(delta):
	get_input()
	move_and_slide()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("up"):
		$characterGoDown.hide()
		$characterGoSideways.hide()
		$characterGoUp.show()
		active_marker = $ScopeUp
		
	elif Input.is_action_just_pressed("down"):
		$characterGoDown.show()
		$characterGoSideways.hide()
		$characterGoUp.hide()
		active_marker = $ScopeDown
		
	elif Input.is_action_just_pressed("right"):
		$characterGoDown.hide()
		$characterGoUp.hide()
		$characterGoSideways.show()
		$characterGoSideways.flip_h = true
		active_marker = $ScopeRight
		
	elif Input.is_action_just_pressed("left"):
		$characterGoSideways.show()
		$characterGoUp.hide()
		$characterGoDown.hide()
		$characterGoSideways.flip_h = false
		active_marker = $ScopeLeft
		
		
	elif Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var b = Bullet.instantiate()
	get_tree().current_scene.add_child(b)
	b.global_transform = active_marker.global_transform
	
