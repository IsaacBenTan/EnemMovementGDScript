extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

signal player_died

const SPEED = 40.0
var direction = -1.0

func _process(delta: float) -> void:
	position.x += direction * SPEED * delta
	
	
	animated_sprite_2d.flip_h = direction > 0


func _on_timer_timeout() -> void:
	direction *= -1   


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" and body.alive:
		emit_signal("player_died", body)
