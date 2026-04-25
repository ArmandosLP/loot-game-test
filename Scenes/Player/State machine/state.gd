class_name PlayerState extends Node

@export var state_machine: PlayerStateMachine
@export var player: Player
@export var pam: PlayerAnimationManager
@export var altitude_manager: AltitudeManager

@warning_ignore("unused_parameter")
func _on_directional_input(direction : Vector2) -> void:
	pass
	
func _on_jump_input() -> void:
	pass

func _on_state_ended() -> void:
	pass

func _on_state_started() -> void:
	pass
	
func _on_physics_ticks(_delta : float) -> void:
	pass
