@tool
class_name PlayerCharacter
extends CharacterBody3D


@export var SPEED = 3.0
@export var JUMP_VELOCITY = 4.5
@export var user_controlled: bool = true
@export var alive:bool = true
@onready var camera_3d = get_node("Camera3D")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	pass

func _physics_process(delta):
	if user_controlled:
		handle_input(delta)
	# Add the gravity.
func handle_input(delta):
	camera_3d.make_current()
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("player_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_axis("player_left", "player_right")
	var direction = (transform.basis * Vector3(input_dir, 0, 0)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	velocity.z = 0;
	move_and_slide()
