extends Area2D

@onready var yellow_sprite: Sprite2D = $yellow_sprite
@onready var green_sprite: Sprite2D = $green_sprite
@onready var slechte_banaan: Sprite2D = $SlechteBanaan

@export var is_green: bool = false 
@export var is_bad: bool = false

func _ready() -> void:
	add_to_group("bananas")
	if is_green:
		yellow_sprite.visible = false
		green_sprite.visible = true
		slechte_banaan.visible = false
	if is_bad:
		yellow_sprite.visible = false
		green_sprite.visible = false
		slechte_banaan.visible = true

func _process(delta: float) -> void:
	position.y += Globals.banana_speed * delta
	yellow_sprite.rotate(3 * delta)
	green_sprite.rotate(3 * delta)
	slechte_banaan.rotate(3 * delta)
	if position.y > 300 and not is_bad:
		Globals.health -= 1
		queue_free()
