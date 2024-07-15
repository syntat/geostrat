extends Camera2D

var resolution: Vector2
var screen_centre: Vector2
var velocity: Vector2
# there is a circle in the centre of the screen of radius r that is used to check against mouse 
# position, if it is outside the camera moves along the 'normal' with speed linearly proportional to the 
# distance outside of the radius 
var radius := 160

func _ready():
	velocity = Vector2(0,0)
	resolution = get_viewport_rect().size
	position = resolution / 2
	screen_centre = resolution / 2
	print("RESOLUTION IS : ", resolution)
func _process(delta):
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	var v: Vector2 = mouse_position - screen_centre
	velocity = Vector2(0,0)
	if v.length() > radius: 
		velocity = (v) * 30 * delta 
	
	position += velocity * delta
	
