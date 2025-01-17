extends CharacterBody2D

@onready var health_bar: ProgressBar = $HealthBar
var inv = false
var getting_hit = false


const speed = 100

func _ready() -> void:
	health_bar.value = Global.player_health

func _process(delta: float) -> void:
	health_bar.value = Global.player_health
	if getting_hit == true and inv == false:
		print('player took damage')
		Global.player_health -= 1
		$SFX_Damage.play()
		inv = true
		$inv_frames.start()

#Handles Movement
func _physics_process(delta):
	player_movement(delta)
	Global.player_position.emit(global_position)
		
	
	if velocity == Vector2(0, 0):
		$SFX_Walk.stop()

func player_movement(delta):
	var direction = Input.get_vector('ui_left', 'ui_right', 'ui_up', 'ui_down')
	$SFX_Walk.play()
	velocity = direction * speed
	move_and_slide()

func player():
	pass


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("enemy"):
		print('enemyentered')
		getting_hit = true
		
	


func _on_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("enemy"):
		getting_hit = false


func _on_inv_frames_timeout() -> void:
	inv = false
