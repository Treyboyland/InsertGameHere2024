extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered(area: Area3D) -> void:
	do_game_completion(area)


func _on_body_entered(body: Node3D) -> void:
	do_game_completion(body)

func do_game_completion(node: Node) -> void:
	if(node.is_in_group("Player")):
		# We should probably do some fanfare first, but we shall go to the next level
		Global.go_to_next_level()
