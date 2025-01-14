extends CharacterBody2D

var speed = 25
var player_chase = false
var player = null

func _ready():
	$AnimatedSprite2D.play("default")
	
func _physics_process(delta):
	if player_chase:
		position += (player.position - position)/speed
		
		
func _on_detection_area_body_entered(body):
	print("player eneterd")
	player = body
	player_chase  = true
	
func _on_detection_area_body_exited(body):
	print("player exited")
	player = null
	player_chase = false


func _on_hitbox_body_entered(body: Node2D) -> void:
	Global.player_health -= 1
	print("player took damage")
	
	
