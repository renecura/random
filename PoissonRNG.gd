extends Reference
class_name PoissonRNG

export var lambda: float = 1.0

# Algoritmo de Knuth
func next() -> int:

	var k: int = 0
	var p: float = 1
	var L: float = exp(-lambda)

	while p > L:
		k += 1
		p *= randf()
		
	return k - 1
