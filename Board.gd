extends Node2D

var dimensions := Vector2(20, 20)
var tile := load("res://tile.tscn")

func _ready():
	for col in range(0, dimensions.x-1):
		for row in range(0, dimensions.y-1):
			var t = tile.instantiate()
			t.tileNumber = Vector2(row, col)
			t.update_position()
			t.randomize_sprite()
			add_child(t)
			t.selected.connect(on_selection)

func _process(delta):
	pass

func on_selection(row: int, col: int):
	print(row, " ", col)
