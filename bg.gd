extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

enum STATES {
	FOREGROUND,
	BACKGROUND
}

var current_state = STATES.BACKGROUND

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.animation_finished.connect(_anim_finished)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _anim_finished(animation_name):
	if animation_name == "intro":
		current_state = STATES.FOREGROUND
