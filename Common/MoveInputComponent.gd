class_name MoveInputComponent
extends Node
@onready var sample_gong = $"../Wwise Sound Events/SampleGong"

@export var move_component:MovementComponent
@export var move_stats:MoveStats

func _process(delta):
	var input_axis = Input.get_axis("ui_left", "ui_right")
	move_component.accelleration.x = input_axis * move_stats.move_speed
	if Input.is_action_just_released("ui_up"):
		move_component.actor.velocity.y = -move_stats.jump_power
		sample_gong.post_event()
