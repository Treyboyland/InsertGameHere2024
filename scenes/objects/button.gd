extends Node3D

@export var is_on : bool = true
@export var is_one_use : bool = false

@export var on_material : Material
@export var off_material : Material

signal button_state_changed(newValue : bool)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	updateMaterials()

func updateMaterials() -> void:
	$ButtonTop.material_override = on_material if is_on else off_material
	
func checkForPlayerEnter(body : Node3D) -> void:
	if body is PlayerCharacter and is_on:
		is_on = false
		updateMaterials()
		button_state_changed.emit(is_on)
		
func checkForPlayerExit(body : Node3D) -> void:
	if body is PlayerCharacter and (not is_on and not is_one_use):
		is_on = true
		updateMaterials()
		button_state_changed.emit(is_on)
