class_name PlayerAnimationManager extends AnimationPlayer

# This 2 variables control all the animations
var animation : AnimationType = AnimationType.IDLE:
	set(value):
		animation = value
		_update_animation()
var direction : Vector2 = Vector2.DOWN:
	set(value):
		direction = value
		_update_animation()

enum AnimationType {
	WALK, 
	JUMP, 
	FALL,
	IDLE,
	}

func _ready() -> void:
	# Start animation
	animation = AnimationType.IDLE
	direction = Vector2.DOWN

func _update_animation() -> void:
	play(_animationtType_to_name[animation] + "_" + _direction_to_name[direction])
	if animation == AnimationType.JUMP:
		if direction == Vector2_UP_RIGHT or direction == Vector2_UP_LEFT:
			push_warning("Expected error related to animations, ignore it.")
	
const _animationtType_to_name : Dictionary[AnimationType,String] = {
	AnimationType.WALK : "run", # Temporal, actually walking
	AnimationType.JUMP: "jump",
	AnimationType.FALL: "fall",
	AnimationType.IDLE: "idle",
}

const Vector2_UP_RIGHT := Vector2(1,-1)
const Vector2_UP_LEFT := Vector2(-1,-1)
const Vector2_DOWN_RIGHT := Vector2(1,1)
const Vector2_DOWN_LEFT := Vector2(-1,1)

const _direction_to_name : Dictionary[Vector2,String] = {
	Vector2.UP: "up",
	Vector2.DOWN: "down",
	Vector2.LEFT: "left",
	Vector2.RIGHT: "right",
	Vector2_UP_RIGHT : "up_right",
	Vector2_UP_LEFT : "up_left",
	Vector2_DOWN_RIGHT : "right",
	Vector2_DOWN_LEFT : "left",
}
