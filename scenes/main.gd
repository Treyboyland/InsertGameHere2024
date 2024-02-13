extends Node2D
@onready var ak_listener_3d = $AkListener3D
@onready var ak_listener_2d = $AkListener2D
@onready var camera_2d = $Player/Camera2D
@onready var cam_position = camera_2d.get_screen_center_position()
# Called when the node enters the scene tree for the first time.
func _ready():
	cam_position = camera_2d.get_screen_center_position()
	ak_listener_3d.position = Vector3(cam_position.x, cam_position.y, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cam_position = camera_2d.get_screen_center_position()
	ak_listener_3d.position =  Vector3(cam_position.x, cam_position.y, 0)
