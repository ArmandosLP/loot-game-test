class_name Jumping extends PlayerState

func _on_state_started() -> void:
	altitude_manager.z_velocity += altitude_manager.jump_force
	pam.animation = pam.AnimationType.JUMP

func _on_physics_ticks(_delta : float) -> void:
	if altitude_manager.z_velocity <= 0:
		state_machine.change_state(state_machine.falling)
		return
		
	player.move_and_slide()
	
