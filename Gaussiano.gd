extends KinematicBody2D

var vel = Vector2.RIGHT * 50

var rng = RandomNumberGenerator.new()

var timer = Timer.new()
func _ready():
	timer.one_shot = false
	timer.connect("timeout", self, "new_dir")
	add_child(timer)
	
	timer.start(1.0)

func new_dir():
	vel = vel.rotated(rng.randfn(0.0, 0.2) * 2 * PI)
	rotation = vel.angle()

func _physics_process(delta):
	move_and_collide(vel * delta)
	($"../LineR").add_point(position)
