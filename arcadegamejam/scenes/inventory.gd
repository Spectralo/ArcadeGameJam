extends CanvasLayer

var is_open = true

func _ready():
	close()
	
	
func close():
	get_parent().get_parent().get_parent().invopen = false
	self.visible = false
	is_open = false
	if get_parent().get_parent().get_parent().paused == false:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func open():
	get_parent().get_parent().get_parent().invopen = true
	self.visible = true
	is_open = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	

func _process(delta):
	if is_open == false:
		close()
	if Input.is_action_just_pressed("inventory"):
		if is_open:
			close()
		else:
			open()
