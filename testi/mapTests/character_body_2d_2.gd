extends CharacterBody2D

@export var speed: float = 300.0
@export var activation_distance: float = 20.0
@export var stop_distance: float = 4.0

@onready var player = get_node("/root/Game/player")
@onready var detector: Area2D = $PlayerDetector  # Reference to Area2D

var is_following = false

func _ready():
	# Connect the signal to detect when player enters the Area2D
	detector.body_entered.connect(_on_body_entered)

func _physics_process(delta: float) -> void:
	if not player:
		return

	var to_player = player.global_position - global_position
	var distance = to_player.length()

	# Start following if close enough
	if not is_following and distance <= activation_distance:
		is_following = true

	if is_following:
		if distance > stop_distance:
			var direction = to_player.normalized()
			velocity = direction * speed
		else:
			velocity = Vector2.ZERO
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func _on_body_entered(body):
	if body == player:
		is_following=true
		# You could trigger damage, game over, etc. here
