extends Move
class_name Midair

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var downcast = $"../../RayCast3D"
@onready var root_attachment = $"../../Root"


var landing_height : float = 1.163

const AIR_SPEED := 5.0
const AIR_ACCEL := 8.0

func _ready():
	animation = "midair"
	move_name = "midair"


func check_relevance(_input : InputPackage):
	var floor_point = downcast.get_collision_point()
	if root_attachment.global_position.distance_to(floor_point) < landing_height:
		var xz_velocity = player.velocity
		xz_velocity.y = 0
		if xz_velocity.length_squared() >= 10:
			return "landing_sprint"
		return "landing_run"
	if not _input.actions.is_empty():
		_input.actions.sort_custom(moves_priority_sort)
		if _input.actions[0] != move_name and moves_priority[_input.actions[0]] > moves_priority[move_name]:
			return _input.actions[0]
	return "okay"


func update(input : InputPackage, delta ):
	player.velocity.y -= gravity * delta
	
	var directoion = (player.transform.basis * Vector3(input.input_direction.x , 0 , input.input_direction.y)).normalized()
	var target_velocity = directoion * AIR_SPEED
	
	player.velocity.x = move_toward(player.velocity.x, target_velocity.x , AIR_ACCEL*delta)
	player.velocity.z = move_toward(player.velocity.z, target_velocity.z , AIR_ACCEL*delta)
	player.move_and_slide()
		# Delete comments if bothered c:
