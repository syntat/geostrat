extends Node2D

@onready var scanner := $ColorRect
# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = Vector2(800, 450)
	scanner.position = Vector2(800, 450) - Vector2(160, 160)
	queue_redraw()

func _process(delta):
	pass

func _draw():
	var length := 160
	var point : Vector2
	for i in range(1, 41):
		var offset_x := Vector2(i * 4, 0)
		var offset_y := Vector2(0, i * 4)
		draw_line(self.position - offset_x, self.position - offset_x - Vector2(0, length), Color.CADET_BLUE, 1.0)
		draw_line(self.position - offset_y, self.position - offset_y - Vector2(length, 0), Color.CADET_BLUE, 1.0)


func _on_camera_main_camera_moved(pos):
	# 240 205 in order to centre the scanner on the miniboard
	# 160 160 = the size of the minimap
	#  80  45 = half the size of the scanner
	scanner.position = self.position - Vector2(240, 205) + Vector2((pos.x / 1600.0) * 160, (pos.y / 1600.0) * 160)
