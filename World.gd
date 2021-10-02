extends Node2D

var map_size = Vector2(300, 150)
var noise = OpenSimplexNoise.new()

func _ready():

	# Configure
	noise.seed = hash($"../Seed".text)
	noise.octaves = 1
	noise.period = 20.0
	noise.persistence = 0.8

	generate_map($TileMap, noise)
	generate_map($TileMap2, noise, 0, 7)
	
	# $Camera2D.position = 64 * map_size / 2

func generate_map(map: TileMap, noise: OpenSimplexNoise, threshold: float = 0, z: float = 0) -> void:
	map.clear()
	
	var s = 0.0
	for x in map_size.x:
		for y in map_size.y:
			var v = noise.get_noise_3d(x, y, z);
			s += v
			if v > threshold:
				map.set_cell(x, y, 0)

	map.update_bitmask_region(Vector2.ZERO, map_size)

	print("Generate Map: ", s / (map_size.x * map_size.y))


func _on_SpinBox_value_changed(value):
	generate_map($TileMap, noise, value)
	generate_map($TileMap2, noise, value, 7)


func _on_Seed_text_changed() -> void:
	noise.seed = hash($"../Seed".text)
	generate_map($TileMap, noise, $"../Threshold".value)
	generate_map($TileMap2, noise, $"../Threshold".value, 7)


func _on_Octaves_value_changed(value: float) -> void:
	noise.octaves = value
	generate_map($TileMap, noise, $"../Threshold".value)
	generate_map($TileMap2, noise, $"../Threshold".value, 7)
