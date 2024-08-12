extends CanvasLayer

var is_open = true

func _ready():
	close()
	
	
func close():
	self.visible = false
	is_open = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	get_parent().get_parent().get_parent().paused = false


func open():
	self.visible = true
	is_open = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_parent().get_parent().get_parent().paused = true

	

func _process(delta):
	if is_open == false:
		close()
	if Input.is_action_just_pressed("inventory"):
		if is_open:
			close()
		else:
			open()
