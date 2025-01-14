extends CharacterBody2D

@onready var health_bar: ProgressBar = $HealthBar


const speed = 100

var player_health = 10 

#Sets healthbar to max health at the start of the game
func _ready() -> void:
	health_bar.value = player_health

#Constantly updates the healthbar
func _process(delta: float) -> void:
	health_bar.value = player_health

#Debug tools to manually change the healthbar
func _on_player_health_up_pressed() -> void:
	player_health += 1

func _on_player_health_down_pressed() -> void:
	player_health -= 1


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
