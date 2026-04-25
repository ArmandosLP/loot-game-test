class_name InputManager extends Node

signal directional_input(direction : Vector2)
signal jump_input()

func _physics_process(_delta: float) -> void:
	var dir := Vector2(
		Input.get_axis("move_left","move_right"),
		Input.get_axis("move_up","move_down")
	)
	directional_input.emit(dir)
	
	if Input.is_action_just_pressed("jump"):
		jump_input.emit()
