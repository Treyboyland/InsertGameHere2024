extends Node3D

## True if the door is currently opened
@export var is_open : bool = false
## True if you want the door to stay open if it is opened
@export var stay_open_if_open = true
@export var open_height : float = 5
## True if we should open based upon height of the door instead. Overrides open height
@export var use_door_height : bool = false
@export var seconds_to_open : float = 0.5
@export var seconds_to_close : float = 0.5

var current_tween : Tween
var initialPosition : Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initialPosition = $DoorBlocker.position
	pass # Replace with function body.

	
func openDoor():
	is_open = true
	if current_tween:
		current_tween.kill()
	current_tween = create_tween()
	if not use_door_height:
		current_tween.tween_property($DoorBlocker, "position", initialPosition + Vector3.UP * open_height, seconds_to_open)
	else:
		current_tween.tween_property($DoorBlocker, "position", initialPosition + Vector3.UP * $DoorBlocker.size.y, seconds_to_open)
		
	
func closeDoor():
	is_open = false
	if current_tween:
		current_tween.kill()
	current_tween = create_tween()
	current_tween.tween_property($DoorBlocker, "position", initialPosition, seconds_to_close)	
	

func changeDoorBasedOnButtonState(buttonOn : bool):
	if buttonOn and is_open and not stay_open_if_open:
		closeDoor()
	elif not buttonOn and not is_open:
		openDoor()

