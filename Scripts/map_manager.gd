extends Node

# MapManager is a global script to give access to collision tilemap
# temporal implementation
var map : TileMapLayer

func get_ground_level(position: Vector2) -> int:
	var cell := map.local_to_map(position)
	var tile_data := map.get_cell_tile_data(cell)
	
	if tile_data == null:
		return 0
	
	return tile_data.get_custom_data("ground_level")
