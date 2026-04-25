class_name PlayerStateMachine extends Node

@export_group("Dependences")
@export var input_manager: InputManager

@export_group("Player states")
@export var walking: Walking
@export var idle: Idle
@export var jumping: Jumping
@export var falling: Falling

# Gives more control to external management
signal state_after_change(old_state : PlayerState, new_state : PlayerState)
signal state_before_change(old_state : PlayerState, new_state : PlayerState) 

# Current state, never change it manually, use change_state
var _current_state : PlayerState

func _ready() -> void:
	_current_state = idle
	input_manager.directional_input.connect(_on_directional_input)
	input_manager.jump_input.connect(_on_jump_input)

func change_state(new_state : PlayerState):
	var old_state : PlayerState = _current_state
	
	state_before_change.emit(old_state, new_state)
	
	_current_state._on_state_ended()
	_current_state = new_state
	_current_state._on_state_started()
	
	state_after_change.emit(old_state, new_state)

func _on_directional_input(direction : Vector2) -> void:
	_current_state._on_directional_input(direction)

func _on_jump_input() -> void:
	_current_state._on_jump_input()

func _physics_process(delta: float) -> void:
	_current_state._on_physics_ticks(delta)
