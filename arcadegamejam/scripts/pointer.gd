extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$MeshInstance2D.position.x = $MeshInstance2D.get_viewport_rect().size.x / 2
	$MeshInstance2D.position.y = $MeshInstance2D.get_viewport_rect().size.y / 2
	
	$Label.position.x = $Label.get_viewport_rect().size.x /2 + 60
	$Label.position.y = $Label.get_viewport_rect().size.y /2 - 60

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func hideE():
	$Label.hide()
	
func showE():
	$Label.show()
