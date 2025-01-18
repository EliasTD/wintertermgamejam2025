extends CharacterBody2D

var speed = 30
var health = 50
var health_max = 50
const BULLET = preload("res://Scenes/cpu_bullet.tscn")

@onready var top_cannon: Marker2D = $top_c
@onready var left_cannon: Marker2D = $left_c
@onready var bot_cannon: Marker2D = $bot_c
@onready var right_cannon: Marker2D = $right_c

func _ready():
	$AnimatedSprite2D.play("default")
	$cooldown.start()
	

	
func _physics_process(delta):
	velocity = position.direction_to(Global.player_position) * speed
	move_and_slide()
	if health <= 0:
		self.queue_free()
			

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.has_method("bullet"):
		health -= 1
		print("enemy took damage")
		
func enemy():
	pass
		



func _on_cooldown_timeout() -> void:
	attack()
	$cooldown.start()

func attack():
	var bullet_instance_1 = BULLET.instantiate()
	get_tree().root.add_child(bullet_instance_1)
	bullet_instance_1.global_position = top_cannon.global_position
	bullet_instance_1.velocity = velocity/20
	
	var bullet_instance_2 = BULLET.instantiate()
	get_tree().root.add_child(bullet_instance_2)
	bullet_instance_2.global_position = left_cannon.global_position
	bullet_instance_2.velocity = velocity/20
	
	var bullet_instance_3= BULLET.instantiate()
	get_tree().root.add_child(bullet_instance_3)
	bullet_instance_3.global_position = bot_cannon.global_position
	bullet_instance_3.velocity = velocity/20
	
	var bullet_instance_4 = BULLET.instantiate()
	get_tree().root.add_child(bullet_instance_4)
	bullet_instance_4.global_position = right_cannon.global_position
	bullet_instance_4.velocity = velocity/20
	
	
