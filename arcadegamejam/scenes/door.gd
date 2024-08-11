extends StaticBody3D

const TARGETABLE = true
var isOpen = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func activate():
	$AnimationPlayer.play("open")

	


func _on_animation_player_animation_finished(_anim_name):
	isOpen = true
	get_tree().root.get_child(0).nextLevel()
