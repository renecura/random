extends Node2D

var map_size = Vector2(100, 50)
var noise = OpenSimplexNoise.new()

func _ready():

	# Configure
	noise.seed = 65487231
	noise.octaves = 1
	noise.period = 20.0
	noise.persistence = 0.8

	generate_map($TileMap, noise)
	
	# $Camera2D.position = 64 * map_size / 2

func generate_map(map: TileMap, noise: OpenSimplexNoise, threshold: float = 0) -> void:
	var s = 0.0
	for x in map_size.x:
		for y in map_size.y:
			var v = noise.get_noise_2d(x, y);
			s += v
			if v > threshold:
				map.set_cell(x, y, 0)

	map.update_bitmask_region(Vector2.ZERO, map_size)

	print("Generate Map: ", s / (map_size.x * map_size.y))


func _on_SpinBox_value_changed(value):
	$TileMap.clear()
	generate_map($TileMap, noise, value)
