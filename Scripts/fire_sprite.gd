extends CharacterBody2D

var speed = 50
var health = 10
var health_max = 10
signal died




func _ready():
	$AnimatedSprite2D.play("default")
	

	
func _physics_process(delta):
	move_and_collide(Vector2(0,0))
	position += (Global.player_position - position)/speed
	if health <= 0:
		died.emit()
		self.queue_free()
			
		
		
	
		
	

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.has_method("bullet"):
		health -= 1
		print("enemy took damage")
		
func enemy():
	pass
		
