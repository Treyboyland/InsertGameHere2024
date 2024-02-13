extends Node2D
@onready var sample_gong = $SampleSound
@onready var timer = $Timer
@export var delay_between_sounds:float = 4.0
@export var event_node:AkEvent3D = null
# Called when the node enters the scene tree for the first time.
func _ready():
	var parent_position = get_global_transform_with_canvas().get_origin()
	var z_position = Global.calculate_z_position(parent_position.x)
	event_node.global_position = Vector3(parent_position.x, parent_position.y, z_position)
	print(parent_position)
	print(event_node.position)
	timer.wait_time = delay_between_sounds

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var parent_position = get_global_transform_with_canvas().get_origin()
	var z_position = Global.calculate_z_position(parent_position.x)
	event_node.global_position = Vector3(parent_position.x, parent_position.y, z_position)

func _on_timer_timeout():
	event_node.post_event()
