@tool
extends Node2D
@onready var ak_bank_2 = $AkBank2

@export_group("3D Sound Fakery Settings")
@export var minimum_z:float = 100
@export var maximum_z:float = 400
@export var max_distance_to_map:float = 1920/2 * 1.5
@export var falloff_curve:Curve = null
# Called when the node enters the scene tree for the first time.
func _ready():
	falloff_curve.min_value = minimum_z
	falloff_curve.max_value = maximum_z
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		falloff_curve.min_value = minimum_z
		falloff_curve.max_value = maximum_z

func calculate_z_position(objectX):
	var viewport = get_viewport_rect()
	var viewportWidth = viewport.size.x
	var viewportCenterX = viewportWidth / 2  # Calculate center X of the viewport
	var distanceFromCenter = min( abs(objectX - viewportCenterX), max_distance_to_map)  # Distance of the object from the viewport's center
	# Normalize the distance to a range of 0 to 1, where 0 is center and 1 is at the edge
	var normalizedDistance = distanceFromCenter / max_distance_to_map

	# Calculate Z position as the inverse of the normalized distance, so it's max at center and 0 at edges
	var zPosition = falloff_curve.sample(normalizedDistance)

	return zPosition
