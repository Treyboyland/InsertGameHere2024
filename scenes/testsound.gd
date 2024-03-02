extends AkEvent3D

@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.connect("timeout", _play_sound)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _play_sound():
	post_event()
