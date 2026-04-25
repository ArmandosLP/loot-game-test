class_name Player extends CharacterBody2D

# Debug
@export var state_machine: PlayerStateMachine

# Print every state change
func _ready() -> void:
	var print_state := func _on_state_change(
		old_state : PlayerState, 
		new_state : PlayerState): 
			print("Player state change: ", old_state.name, " -> ", new_state.name)
	state_machine.state_after_change.connect(print_state)
