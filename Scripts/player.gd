extends CharacterBody2D

@onready var health_bar: ProgressBar = $HealthBar


const speed = 100

func _ready() -> void:
	health_bar.value = Global.player_health

func _process(delta: float) -> void:
	health_bar.value = Global.player_health

#Handles Movement
func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	if Input.is_action_pressed("ui_up"):
		velocity.y = -speed
	if Input.is_action_pressed("ui_down"):
		velocity.y = speed
	if !(Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_left") or 
	Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up")):
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
