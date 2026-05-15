extends AnimatedSprite2D
@onready var root: Node2D = $".."
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var rich_text_label: RichTextLabel = $"../RichTextLabel"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_area_2d_mouse_entered() -> void:
	if root.current_state == root.STATES.FOREGROUND:
		scale = Vector2(1.2, 1.2)
		speed_scale = 2

func _on_area_2d_mouse_exited() -> void:
	scale = Vector2(1, 1)
	speed_scale = 1


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_mask == 1:
		animation_player.stop()
		animation_player.play("click")
		rich_text_label.next()
