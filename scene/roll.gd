extends Move
class_name  Roll

var roll_distance = 10.0

func _ready() -> void:
	animation = "roll"

func check_relevance(input : InputPackage):
	if input.actions[0] == "roll":
		return input.actions[0]
	return "okay"

func update(input : InputPackage, delta : float):
	player.velocity = velocity_by_input(input, delta)
	player.move_and_slide()


func velocity_by_input(input : InputPackage, delta : float) -> Vector3:
	var new_velocity = player.velocity
	
	var direction = (player.transform.basis * Vector3(input.input_direction.x, 0, input.input_direction.y)).normalized()
	new_velocity.x ==  roll_distance
	new_velocity.z == roll_distance
	
	
		
	return new_velocity
