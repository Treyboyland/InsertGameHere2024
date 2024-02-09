class_name MovementComponent
extends Node

@export var actor:CharacterBody2D
@export var accelleration:Vector2
@export var move_stats:MoveStats
@onready var player_lands = $"../Wwise Sound Events/PlayerLands"

func _process(delta:float) -> void:
	actor.velocity += accelleration
	actor.velocity.y += move_stats.gravity
	actor.velocity.x *= move_stats.friction
	
func _physics_process(delta:float) -> void:
	var collides = actor.move_and_slide()
	

