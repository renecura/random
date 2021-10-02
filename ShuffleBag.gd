extends Reference
class_name ShuffleBag

var rng: = RandomNumberGenerator.new()
var _elems: Array
var _run = []

var runs: int = 1

func _init(elements: Array) -> void:
	_elems = elements

func next() -> Object:
	if _run.empty():
		_refill()
	
	return _run.pop_front()

func _refill() -> void:
	for i in runs:
		for e in _elems:
			_run.insert(rng.randi_range(0,_run.size()), e)
