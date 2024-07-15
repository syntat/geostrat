extends Camera2D

var velocity: Vector2
var nail: Vector2
var scrolling: bool

# FIX: Problems with clamping of the camera - no smooth movement when skirting the edges

var last_mouse_position: Vector2
var current_mouse_position: Vector2
var mouse_delta: Vector2
var just_started_scroll: bool = true

func _ready():
	scrolling = false
	pass
	
func _process(delta):
	velocity = Vector2.ZERO
	if scrolling:
		current_mouse_position = get_local_mouse_position()
		if just_started_scroll: 
			last_mouse_position = current_mouse_position
			just_started_scroll = false
		mouse_delta = current_mouse_position - last_mouse_position 
		last_mouse_position = current_mouse_position
	if Input.is_action_pressed("scroll"):
		scrolling = true
	if Input.is_action_just_released("scroll"):
		scrolling = false
		just_started_scroll = true
		mouse_delta = Vector2(0,0)
	position -= mouse_delta
	
	
	
