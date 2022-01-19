class_name Camera
extends Camera2D

# a String containing the ui up input constant
const s_up = "up"

# a String containing the ui down input constant
const s_down = "down"

# a String containing the ui left input constant
const s_left = "left"

# a String containing the ui right input constant
const s_right = "right"

# a float containing the camera movement speed constant
const f_speed : float = 100.0

# a float containing the camera zoom speed constant
const f_zoom_speed : float = 0.10

# a trinary containing the x movement direction 
var _tri_x: int = 0
@export var tri_x: int: 
	get: return _tri_x

# a trinary containing the y movement direction
var _tri_y: int = 0
@export var tri_y: int: 
	get: return _tri_y

# a trinary containing the zoom movement direction
var _tri_zoom: int = 0
@export var tri_zoom: int: 
	get: return _tri_zoom

# called each physics tick
# delta: float containing the time since the last physics tick in seconds
# returns void
func _physics_process(delta: float) -> void:
	# apply horizontal movement
	if tri_x == 1:
		position.x += f_speed * delta
	elif tri_x == -1:
		position.x -= f_speed * delta
	
	# apply vertical movement
	if tri_y == 1:
		position.y += f_speed * delta
	elif tri_y == -1:
		position.y -= f_speed * delta
	
	# apply zoom movement
	set_zoom(get_zoom() * (1 - f_zoom_speed * tri_zoom))
	_tri_zoom = 0

# called upon input event
# handles camera movement inputs
# event: the InputEvent that caused this function to be called
# returns void
func _input(event: InputEvent) -> void:
	if event.is_action_pressed(s_up):
		_tri_y = -1
		
	elif event.is_action_pressed(s_down):
		_tri_y = 1
		
	elif event.is_action_pressed(s_left):
		_tri_x = -1
		
	elif event.is_action_pressed(s_right):
		_tri_x = 1
		
	elif event.is_action_released(s_up):
		if tri_y == -1:
			if Input.is_action_pressed(s_down):
				_tri_y = 1
			else:
				_tri_y = 0
		
	elif event.is_action_released(s_down):
		if tri_y == 1:
			if Input.is_action_pressed(s_up):
				_tri_y = -1
			else:
				_tri_y = 0
		
	elif event.is_action_released(s_left):
		if tri_x == -1:
			if Input.is_action_pressed(s_right):
				_tri_x = 1
			else:
				_tri_x = 0
		
	elif event.is_action_released(s_right):
		if tri_x == 1:
			if Input.is_action_pressed(s_left):
				_tri_x = -1
			else:
				_tri_x = 0
	
	elif event is InputEventMouseButton and event.pressed and event.get_button_index() == MOUSE_BUTTON_WHEEL_UP:
		_tri_zoom = 1
	elif event is InputEventMouseButton and event.pressed and event.get_button_index() == MOUSE_BUTTON_WHEEL_DOWN:
		_tri_zoom = -1
