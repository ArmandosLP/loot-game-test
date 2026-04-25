class_name Idle extends PlayerState

func _on_jump_input() -> void:
	state_machine.change_state(state_machine.jumping)

func _on_directional_input(direction : Vector2) -> void:
	if direction != Vector2.ZERO:
		state_machine.change_state(state_machine.walking)
	
func _on_state_started() -> void:
	player.velocity = Vector2(0,0)
	pam.animation = pam.AnimationType.IDLE
