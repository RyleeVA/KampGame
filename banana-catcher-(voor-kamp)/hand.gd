extends Area2D

@onready var sprite_2d: Sprite2D = $"../Sprite2D"

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bananas"):
		if area.is_bad:
			Globals.health -= 1
		elif area.is_green and Globals.player_speed < 600:
			Globals.player_speed += 50
			Globals.total_bananas += 1
		else:
			Globals.total_bananas += 1
		Globals.banana_speed += 10.0
		tween_scale()
		area.queue_free()

func tween_scale():
	var new_tween = create_tween()
	new_tween.tween_property(sprite_2d, "scale", Vector2(0.4, 0.05), 0.2).set_trans(Tween.TRANS_BOUNCE)
	new_tween.tween_property(sprite_2d, "scale", Vector2(0.2, 0.2), 0.2).set_trans(Tween.TRANS_BOUNCE)
