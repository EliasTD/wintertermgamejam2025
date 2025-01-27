extends Node2D

const BULLET = preload("res://Scenes/bullet.tscn")
var loaded = true

@onready var muzzle: Marker2D = $Marker2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1
		
	if Input.is_action_pressed("shoot"):
		if loaded == true:
			var bullet_instance = BULLET.instantiate()
			get_tree().root.add_child(bullet_instance)
			bullet_instance.global_position = muzzle.global_position
			bullet_instance.rotation = rotation
			loaded = false
			$SFX_Shoot.play()
			$Timer.start()
		


func _on_timer_timeout() -> void:
	loaded = true
