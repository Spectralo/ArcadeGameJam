extends StaticBody3D

const TARGETABLE = true
var isOn = true

@onready var shaderOff = load('res://shaders/lampoff.tres')
@onready var shaderOn = load('res://shaders/lampon.tres')

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func activate():
	if isOn:
		isOn = false
		$"lamp/BézierCurve_001".set_surface_override_material(1,shaderOff)
		await get_tree().create_timer(0.05).timeout
		$"lamp/BézierCurve_001".set_surface_override_material(1,shaderOn)
		await get_tree().create_timer(0.05).timeout
		$"lamp/BézierCurve_001".set_surface_override_material(1,shaderOff)
		await get_tree().create_timer(0.05).timeout
		$"lamp/BézierCurve_001".set_surface_override_material(1,shaderOn)
		await get_tree().create_timer(0.05).timeout
		$"lamp/BézierCurve_001".set_surface_override_material(1,shaderOff)
	else:
		$"lamp/BézierCurve_001".set_surface_override_material(1,shaderOn)
		await get_tree().create_timer(randf_range(0.01,0.1)).timeout
		$"lamp/BézierCurve_001".set_surface_override_material(1,shaderOff)
		await get_tree().create_timer(randf_range(0.01,0.1)).timeout
		$"lamp/BézierCurve_001".set_surface_override_material(1,shaderOn)
		isOn = true
	
