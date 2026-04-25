class_name AltitudeManager extends Node

@export_group("Dependences")
@export var player_colision: CollisionShape2D
@export var player: Player
@export var player_sprite: Sprite2D
@export var player_shadow: Sprite2D

@export_group("Properties")
@export var gravity : float = 600
@export var jump_force : float = 200

const MASK_OFFSET := 17 # Collision layer of walls go from 17 - 24
const Z_STEP = 16

var current_z_level : int = -1
var z_velocity : float = 0 # Velocity at the player is moving in z axis
var z : float = 0 # Z position of the player / antitude

func _physics_process(delta: float) -> void:
	var ground_level : float = MapManager.get_ground_level(player.position) * Z_STEP
	
	var delta_z_velocity := z_velocity * delta
	var delta_gravity := gravity * delta
	
	z += delta_z_velocity
	
	if z <= ground_level:
		z = ground_level
		z_velocity = 0
	else:
		z_velocity -= delta_gravity
	
	# This avoids updating collision masks every frame
	var new_z_level := int(floor(z / Z_STEP))
	if new_z_level != current_z_level:
		update_collision_masks(new_z_level)
		current_z_level = new_z_level
	
	player_sprite.position.y = -z
	
	player_shadow.frame = clamp(floor((z - ground_level) / 10),0,3)
	player_shadow.position.y = -ground_level

func update_collision_masks(z_level: int) -> void:
	for mask in range(8):
		if z_level >= mask:
			player.set_collision_mask_value(MASK_OFFSET + mask, false)
		else:
			player.set_collision_mask_value(MASK_OFFSET + mask, true)
