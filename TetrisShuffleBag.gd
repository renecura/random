extends Control

const Pieza = preload("res://tetris/Pieza.tscn")

var bag = ShuffleBag.new([0,1,2,3,4,5,6])

onready var bars = $Centro.get_children()

var frombag = [0,0,0,0,0,0,0]
var fromrng = [0,0,0,0,0,0,0]

func _ready() -> void:
	bag.runs = 1

func pieza_bag() -> void:
	var p = Pieza.instance()
	p.position.x = randi() % 400 + 50
	p.pieza = bag.next()
	add_child(p)
	
	bars[p.pieza].get_node("Bag").value += 2


func pieza_rng() -> void:
	var p = Pieza.instance()
	p.position.x = randi() % 400 + 50 + 512
	p.pieza = randi() % 7
	add_child(p)
	
	bars[p.pieza].get_node("Rng").value += 2


func _on_Timer_timeout() -> void:
	pieza_bag()
	pieza_rng()
