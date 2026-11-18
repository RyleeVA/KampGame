extends Sprite2D

func _on_timer_timeout() -> void:
	banana_shake()

func banana_shake():
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.35, 0.35), 0.5).set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "scale", Vector2(0.3, 0.3), 0.5).set_trans(Tween.TRANS_SINE)
