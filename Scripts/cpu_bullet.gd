extends Area2D

var speed: int = 10
var target: Vector2 = Global.player_position
var velocity = Vector2(0, 0)
func _ready():
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += velocity


func bullet():
	pass


func _on_body_entered(body: Node2D) -> void:
	self.queue_free()
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	self.queue_free()
