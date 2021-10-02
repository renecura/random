extends Label

func _ready():
	
	text = " "
	
	# randomize()
	for i in range(10):
		text += str(randi() % 6) + " "
