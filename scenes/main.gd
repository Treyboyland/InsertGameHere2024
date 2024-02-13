extends Node2D

@onready var ak_listener_2d = $AkListener2D
@onready var camera_2d = $Player/Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	ak_listener_2d.position = camera_2d.get_screen_center_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ak_listener_2d.position = camera_2d.get_screen_center_position()
