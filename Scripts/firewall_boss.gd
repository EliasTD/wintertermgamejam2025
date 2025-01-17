extends CharacterBody2D

var health = 50
var health_max = 50
var fire_count = 0
var fire_max = 5
const FIRE = preload("res://Scenes/fire_sprite.tscn")

func _ready():
	$AnimatedSprite2D.play("default")
	$fire_spawn.start()
	
func _physics_process(delta: float) -> void:
	if health <= 0:
		self.queue_free()
		

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.has_method("bullet"):
		health -= 1
		print("enemy took damage")
		



func _on_fire_spawn_timeout() -> void:
	spawn_fire()
	$fire_spawn.start()

func spawn_fire():
	if fire_count < fire_max:
		fire_count += 1
		var fire_instance = FIRE.instantiate()
		get_tree().root.add_child(fire_instance)
		fire_instance.died.connect(_on_fire_died)
		fire_instance.global_position = $Marker2D.global_position
		
func _on_fire_died():
	fire_count -= 1
	
func enemy():
	pass
