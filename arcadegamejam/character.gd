extends CharacterBody3D


const SPEED = 4
const JUMP_VELOCITY = 4
const SENSITIVITY = 0.003 
var gravity = 9.8
var paused = false
@export var inv: Inv 

#bob
const BOB_FREQ = 2.8
const BOB_AMP = 0.08
var t_bob = 0

@onready var head = $Head
@onready var camera = $Head/Camera3D
@onready var raycast = $Head/Camera3D/RayCast3D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$Head/Camera3D/CanvasLayer/Panel2/Label2.text = get_parent_node_3d().GOAL

func _unhandled_input(event):
	if Input.is_action_just_pressed("pause"):
		if paused == false:
			paused = true
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			$Head/Camera3D/CanvasLayer2.show()
		else:
			$Head/Camera3D/CanvasLayer2.hide()
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			paused = false
		
	if event is InputEventMouseMotion and not paused:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-80), deg_to_rad(60))
	

	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity = velocity / 1.01 + get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir
	var direction
	if not paused:
		input_dir = Input.get_vector("left"	, "right", "up", "down")
		direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if is_on_floor():
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = 0.0
			velocity.z = 0.0
	elif not paused:
		velocity.x = lerp(velocity.x , direction.x*SPEED, delta * 1.0)
		velocity.y = lerp(velocity.y , direction.y*SPEED, delta * 1.0)
		
	# Bob !
	t_bob += delta * velocity.length() * float(is_on_floor())
	camera.transform.origin = _headbob(t_bob)
	
	# Handle object highlighting
	highlightTargetableObject()
	
	move_and_slide()


func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ/2 ) * BOB_AMP
	return pos
	
func highlightTargetableObject():
	if raycast.get_collider():
		print("collider")
		var element = raycast.get_collider()
		print(element)
		if "TARGETABLE" in element:
			print("target")
			$Head/Camera3D/CanvasLayer.showE()
			if Input.is_action_just_pressed('use'):
				print("Used")
				element.activate()
		else:
			$Head/Camera3D/CanvasLayer.hideE()
	else:
		$Head/Camera3D/CanvasLayer.hideE()
	
	
	
	
