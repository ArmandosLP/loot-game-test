class_name Falling extends PlayerState

func _on_state_started() -> void:
	pam.animation = pam.AnimationType.FALL

func _on_physics_ticks(_delta : float) -> void:
	if altitude_manager.z_velocity == 0:
		state_machine.change_state(state_machine.idle)
		return

	player.move_and_slide()
