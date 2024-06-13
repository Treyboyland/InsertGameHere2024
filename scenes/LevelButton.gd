extends Button

@export var level_index : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = String.num(level_index)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	disabled = level_index >= Global.level_list.size()


func _on_pressed() -> void:
	Global.go_to_level(level_index)
