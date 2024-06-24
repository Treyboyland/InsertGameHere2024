extends Area3D

## Delay before player can swap again
@export var secondsBetweenSwaps : float

@onready var sphereRadius : Node3D = $SparkCSGSphere3D

var player : PlayerCharacter
var otherPlayer : PlayerCharacter


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent()

func _process(delta: float) -> void:
	updateSphere()
	if Input.is_action_just_pressed("player_swap"):
		attemptSwap()

func updateSphere():
	sphereRadius.visible = player is PlayerCharacter and player.user_controlled and Global.seconds_since_last_swap >= secondsBetweenSwaps

func attemptSwap():
	if Global.seconds_since_last_swap >= secondsBetweenSwaps and player is PlayerCharacter and player.user_controlled and otherPlayer is PlayerCharacter :
		player.user_controlled = false
		otherPlayer.user_controlled = true
		Global.seconds_since_last_swap = 0
	elif Global.seconds_since_last_swap < secondsBetweenSwaps:
		#print ("Spark time not reached")
		pass
	elif player == null:
		#print ("Player is null")
		pass
	elif not player.user_controlled:
		#print ("Spark not active")
		pass
	elif otherPlayer == null:
		#print ("Other player null")
		pass
	

func _on_body_entered(body: Node3D) -> void:
	if not (player is PlayerCharacter) or not player.user_controlled:
		pass
	if body.is_in_group("Player") and not (body == player):
		#print("Body player and not self")
		otherPlayer = body
	else:
		#print("Body not player")
		pass


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		otherPlayer = null
