class_name Walking extends PlayerState

@export var walking_speed : float = 120

func _on_jump_input() -> void:
	state_machine.change_state(state_machine.jumping)

func _on_directional_input(direction : Vector2) -> void:
	if direction == Vector2.ZERO:
		state_machine.change_state(state_machine.idle)
		return
	
	pam.direction = direction
	player.velocity = direction.normalized() * walking_speed

func _on_physics_ticks(_delta : float) -> void:
	if altitude_manager.z_velocity < 0:
		state_machine.change_state(state_machine.falling)
		return
		
	player.move_and_slide()

func _on_state_started() -> void:
	pam.animation = pam.AnimationType.WALK
