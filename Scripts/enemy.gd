extends CharacterBody2D

var speed = 25
var player_chase = false
var player = null
var health = 10
var health_max = 10




func _ready():
	$AnimatedSprite2D.play("default")
	

	
func _physics_process(delta):
	if player_chase:
		move_and_collide(Vector2(0,0))
		position += (player.position - position)/speed
		if health <= 0:
			self.queue_free()
		
		
func _on_detection_area_body_entered(body):
	print("player eneterd")
	player = body
	player_chase  = true
	
func _on_detection_area_body_exited(body):
	print("player exited")
	player = null
	player_chase = false


func _on_hitbox_body_entered(body):
	if body.has_method("player"):
		Global.player_health -= 1
		print("player took damage")
	
		
	

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.has_method("bullet"):
		health -= 1
		print("enemy took damage")
		
