extends Node2D

@export var is_spawning: bool = true
const BANANA = preload("uid://h7bc6ffdw81m")

var spawn_speed = 2
@onready var timer: Timer = $Timer
var spawn_pos = Vector2(0, -550)

func spawn_banana():
	if is_spawning:
		var instance = BANANA.instantiate()
		if randf() < 0.1:
			instance.is_green = true
		elif randf() > 0.9:
			instance.is_bad = true
		add_child(instance)
		if spawn_pos.x < -100:
			spawn_pos.x += randf_range(0, 100)
		elif spawn_pos.x > 100:
			spawn_pos.x += randf_range(-100, 0)
		else:
			if randf() < 0.5:
				spawn_pos.x += -200
			elif randf() > 0.5:
				spawn_pos.x += 200
			else:
				spawn_pos.x += randf_range(-100, 100)
		instance.position = spawn_pos



func _on_timer_timeout() -> void:
	spawn_banana()
	timer.start(spawn_speed)
	if spawn_speed > 0.5:
		spawn_speed -= 0.1
