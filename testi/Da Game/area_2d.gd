extends Area2D
func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Enemy":  # Or use body.is_in_group("Player")
		var sprite = body.get_node("Sprite2D")
		var enemy = "Enemy"
		if sprite:
			
			sprite.visible = false
			
