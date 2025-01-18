extends Area2D

const speed: int = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.x * speed * delta

func bullet():
	pass


func _on_body_entered(body: Node2D) -> void:
	self.queue_free()


	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	self.queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.has_method("enemy"):
		self.queue_free()
