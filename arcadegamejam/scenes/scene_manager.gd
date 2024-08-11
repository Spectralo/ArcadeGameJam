extends Node3D

var level = 1
var scene : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fadein")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func changeScene(scenepath):
	$AnimationPlayer.play("fadeout")
	scene = load(scenepath).instantiate()


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fadeout":
		get_tree().root.get_child(0).remove_child(get_child(0))
		get_tree().root.get_child(0).add_child(scene)
		$AnimationPlayer.play("fadein")
	else:
		pass
		
func nextLevel():
	level += 1
	changeScene('res://scenes/levels/level'+str(level)+'.tscn')
