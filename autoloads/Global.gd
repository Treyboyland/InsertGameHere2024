@tool
extends Node2D
@onready var ak_bank_2 = $AkBank2
@export var main_menu_node_name : String

## Path to the main menu scene file
@export_file("*.tscn") var menu_scene : String

## Use this to get a path (unused in game)
@export_file("*.tscn") var unusedScene : String

## Should be paths to level scenes
@export var level_list : Array[String] = []

## True if the player can move
var can_player_move = true

var current_level : int = 0

var seconds_since_last_swap : float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	seconds_since_last_swap += delta
	if Input.is_action_just_released("game_quit"):
		main_menu_or_quit()
	if Input.is_action_just_pressed("game_reset"):
		reload_current_level()
		
func go_to_next_level():
	current_level = (current_level + 1) % level_list.size()
	attempt_level_load()

func go_to_level(level : int):
	current_level = level
	attempt_level_load()

func attempt_level_load():
	if current_level < level_list.size():
		print("Loading scene attempt")
		SceneSwitcher.switch_scene(level_list[current_level])
	else:
		print ("level overflow")
	
func reload_current_level():
	SceneSwitcher.switch_scene(get_tree().current_scene.scene_file_path)
	
func main_menu_or_quit():
	var nodeName = get_tree().current_scene.get_name()
	if nodeName == main_menu_node_name:
		get_tree().quit()
	else:
		SceneSwitcher.switch_scene(menu_scene)


