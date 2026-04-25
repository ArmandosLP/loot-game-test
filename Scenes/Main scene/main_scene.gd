extends Node2D

@export var tile_map_layer: TileMapLayer

# See also MapManager <- Global script
func _ready() -> void:
	MapManager.map = tile_map_layer
