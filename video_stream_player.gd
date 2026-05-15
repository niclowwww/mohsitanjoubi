extends VideoStreamPlayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_finished() -> void:
	visible = false
	position = Vector2(-199999, -199999)
