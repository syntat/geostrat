extends AnimatedSprite2D

var tileNumber: Vector2 
signal selected(col, row)

func _ready():
	pass

func _process(delta):
	pass
	
func randomize_sprite():
	match randi_range(0, 2):
		0: 
			self.set_animation("default1")
		1:
			self.set_animation("default2")
		2: 
			self.set_animation("default3")
	self.play()
		
func _on_button_mouse_entered():
	self.modulate = Color8(255,255,255,150)

func _on_button_mouse_exited():
	self.modulate = Color8(255,255,255,255)

func _on_button_pressed():
	selected.emit(tileNumber.x, tileNumber.y)

func update_position():
	position = Vector2(80 * tileNumber.x + 40, 80 * tileNumber.y + 40)
