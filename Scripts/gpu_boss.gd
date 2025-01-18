extends CharacterBody2D

var speed = 30
var health = 50
var health_max = 50
var direction = "left"

const TRI = preload("res://Scenes/bug_tri.tscn")
const CUBE = preload("res://Scenes/bug_cube.tscn")
const SPHERE = preload("res://Scenes/bug_sphere.tscn")

@onready var left_spawn: Marker2D = $spawn_l
@onready var middle_spawn: Marker2D = $spawn_c
@onready var right_spawn: Marker2D = $spawn_r

func _ready():
	$AnimatedSprite2D.play("default")
	$cooldown.start()
	$move_timer.start()
	
func _physics_process(delta):
	
	if direction == "left":
		velocity = Vector2(-1, 0) * speed
	if direction == "right":
		velocity = Vector2(1, 0) * speed
	move_and_slide()
	if health <= 0:
		self.queue_free()

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.has_method("bullet"):
		health -= 1

func enemy():
	pass

func _on_cooldown_timeout() -> void:
	attack()
	$cooldown.start()

func attack():
	var tri_instance = TRI.instantiate()
	get_tree().root.add_child(tri_instance)
	tri_instance.global_position = left_spawn.global_position
	
	var cube_instance = CUBE.instantiate()
	get_tree().root.add_child(cube_instance)
	cube_instance.global_position = right_spawn.global_position
	
	var sphere_instance = SPHERE.instantiate()
	get_tree().root.add_child(sphere_instance)
	sphere_instance.global_position = middle_spawn.global_position
	
	


func _on_move_timer_timeout() -> void:
	if direction == "left":
		direction = "right"
	elif direction == "right":
		direction = "left"
	$move_timer.start()
