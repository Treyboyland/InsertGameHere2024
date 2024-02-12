extends CharacterBody2D

@export var move_stats:MoveStats
@onready var player_lands = $"Wwise Sound Events/PlayerLands"

var just_hit_something:bool = false
func _ready():
	pass
	
func _physics_process(delta):
	var touching = get_slide_collision_count()
	if touching and not just_hit_something:
		just_hit_something = true
		#player_lands.post_event()
		
	if not touching:
		just_hit_something = false
	

