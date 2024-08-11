extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("goal")
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Panel2.size.x = $Panel2/Label2.size.x + 110
	$Panel2.size.y = $Panel2/Label2.size.y + 20
	$Label2.text = "FPS : "+str(Engine.get_frames_per_second())

	
func hideE():
	$Label.hide()
	
func showE():
	$Label.show()
