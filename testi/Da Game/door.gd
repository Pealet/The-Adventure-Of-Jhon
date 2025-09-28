extends TileMapLayer
@onready var enemy_sprite = $"../Enemy/Sprite2D"
@onready var tilemap = $"."  # Replace with actual path to your tile layer

func _process(delta):
	if not enemy_sprite.visible:
		tilemap.visible = false
		tilemap.collision_enabled = false
		
		
	else:
		tilemap.visible = true
