extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$MeshInstance2D.position.x = $MeshInstance2D.get_viewport_rect().size.x / 2
	$MeshInstance2D.position.y = $MeshInstance2D.get_viewport_rect().size.y / 2
	
	$Label.position.x = $Label.get_viewport_rect().size.x /2 + 60
	$Label.position.y = $Label.get_viewport_rect().size.y /2 - 60
	
	$Panel3.position.x = $Label.get_viewport_rect().size.x - $Panel3.size.x
	$Panel3.position.y = $Label.get_viewport_rect().size.y - $Panel3.size.y
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Panel2.size.x = $Panel/Label2.size.x + 120
	$Panel2.size.y = $Panel/Label2.size.y + 40

	
func hideE():
	$Label.hide()
	
func showE():
	$Label.show()
