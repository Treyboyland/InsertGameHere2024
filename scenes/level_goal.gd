extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area3D) -> void:
	print("AAHHHHH")
	if area.is_in_group("Player"):
		# We should probably do some fanfare first, but we shall go to the next level
		Global.go_to_next_level()


func _on_body_entered(body: Node3D) -> void:
	print("AAHHHHH")
	if body.is_in_group("Player"):
		# We should probably do some fanfare first, but we shall go to the next level
		Global.go_to_next_level()
