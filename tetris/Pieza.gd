extends Area2D

export var speed: float = 300
export var pieza: int = 0 setget set_pieza

func _ready() -> void:
	$Sprite.frame = pieza

func set_pieza(value: int) -> void:
	pieza = value
	$Sprite.frame = pieza

func _physics_process(delta: float) -> void:
	position.y += speed * delta

func _on_screen_exited() -> void:
	queue_free()
