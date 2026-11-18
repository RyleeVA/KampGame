extends CharacterBody2D


var speed = Globals.player_speed

func _physics_process(_delta: float) -> void:
	speed = Globals.player_speed

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
