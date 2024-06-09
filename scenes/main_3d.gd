extends Node3D
@onready var player = $player
@onready var player_2 = $player2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if Input.is_action_just_released("player_swap"):
			player.user_controlled = not player.user_controlled
			player_2.user_controlled = not player_2.user_controlled
