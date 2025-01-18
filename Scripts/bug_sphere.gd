extends CharacterBody2D

var speed = 50
var health = 2
var health_max = 2

func _ready():
	$AnimatedSprite2D.play("default")
	var diff = position.direction_to(Global.player_position)
	velocity = Vector2(0, diff.y) * speed

func _process(delta: float) -> void:
	move_and_slide()
	if health <= 0:
		self.queue_free()

	
func enemy():
	pass

	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	self.queue_free()

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.has_method("bullet"):
		health -= 1


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		self.queue_free()
