@tool
extends Node2D
@onready var ak_bank_2 = $AkBank2

## Use this to get a path (unused in game)
@export_file("*.tscn") var unusedScene : String

## Should be paths to level scenes
@export var level_list : Array[String] = []

var can_player_move = true

var current_level : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("game_quit"):
		get_tree().quit()
		
func go_to_next_level():
	current_level = (current_level + 1) % level_list.size()
	if current_level < level_list.size():
		print("Loading scene attempt")
		SceneSwitcher.switch_scene(level_list[current_level])
	else:
		print ("level overflow")
	
		


