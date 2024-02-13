extends Node2D
@onready var ak_bank_2 = $AkBank2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func calculate_z_position(objectX):
	var viewport = get_viewport_rect()
	var viewportWidth = viewport.size.x
	var viewportCenterX = viewportWidth / 2  # Calculate center X of the viewport
	var maxDistanceFromCenter = viewportCenterX * 1.5
	var distanceFromCenter = min( abs(objectX - viewportCenterX), maxDistanceFromCenter)  # Distance of the object from the viewport's center
	var maxZ = viewportWidth / 2  # Maximum Z position at the center of the viewport

	# Normalize the distance to a range of 0 to 1, where 0 is center and 1 is at the edge
	var normalizedDistance = distanceFromCenter / viewportCenterX

	# Calculate Z position as the inverse of the normalized distance, so it's max at center and 0 at edges
	var zPosition = (1 - normalizedDistance) * maxZ

	return zPosition
