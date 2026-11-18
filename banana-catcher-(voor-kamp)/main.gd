extends Node2D

@onready var total_bananas: Label = $total_bananas
@onready var health: Label = $health
@onready var lost_text: Label = $lost_text

@onready var tut_label_1: Label = $tut_label1
@onready var banana_spawner: Node2D = $banana_spawner

func _ready() -> void:
	await get_tree().create_timer(5).timeout
	tut_label_1.visible = false

func _process(_delta: float) -> void:
	total_bananas.text = "Bananen: " + str(Globals.total_bananas)
	health.text = "Levens: " + str(Globals.health)
	if Globals.health <= 0:
		lost_text.visible = true
		if is_instance_valid(banana_spawner):
			banana_spawner.is_spawning = false

	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
		Globals.banana_speed = 100.0
		Globals.total_bananas = 0
		Globals.player_speed = 300.0
		Globals.health = 3
		lost_text.visible = false
		banana_spawner.is_spawning = true
