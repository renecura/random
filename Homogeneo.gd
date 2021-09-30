extends KinematicBody2D

var vel = Vector2.RIGHT * 50

var timer = Timer.new()
func _ready():
	timer.one_shot = false
	timer.connect("timeout", self, "new_dir")
	add_child(timer)
	
	timer.start(1.0)

func new_dir():
	vel = vel.rotated((randf() - 0.5) * 2 * PI)

func _physics_process(delta):
	move_and_collide(vel * delta)
	($"../LineH").add_point(position)
