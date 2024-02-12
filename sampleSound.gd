extends Node2D
@onready var sample_gong = $SampleSound
@onready var timer = $Timer
@export var delay_between_sounds:float = 4.0
@export var event_node:AkEvent2D = null
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = delay_between_sounds

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	event_node.post_event()
