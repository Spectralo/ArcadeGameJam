extends Node3D

var level = 1
var scene : Node
var rules = {
	"Inverse Gravity" : inverseGravity()
}
var currentunlockedrule = -1
var unlockedrules = {}
	
## Scene management 

func _ready():
	$AnimationPlayer.play("fadein")

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
	
## Rules
	
func inverseGravity():
	pass
