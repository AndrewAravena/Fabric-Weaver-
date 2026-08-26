extends Move
class_name  dash
#Redifine your class_name
#Redefine your overriden parameters 

const GROUND_DASH_VEL := 30.0
const GROUND_DASH_DURA := 0.25

const AIR_DASH_VEL := 20.0
const AIR_DASH_DURA := 0.3
const AIR_DASH_GRAVITY_FROZEN := true 


var was_airborne : bool = false 
var dash_dir : Vector3 = Vector3.ZERO
var dir_set : bool = false 

func _ready() -> void:
	animation = "asasdasd"
	move_name = "asas"
func on_enter_state():
	was_airborne = not player.is_on_floor()
	dir_set = false 
	

func default_lifecycle( input : InputPackage):
	var duration = AIR_DASH_DURA if was_airborne else GROUND_DASH_DURA #makes sure it uses the right values for the dash
	if not works_less_than(duration):
		return "okay"
	if not player.is_on_floor():
		return "midair"
	
	input.actions.sort_custom(moves_priority_sort)
	if input.actions[0] == move_name:
		return "idle"
	return input.actions[0]
	
	# implement an update function
func update(input : InputPackage, delta : float):
	if not dir_set:
		dash_dir = get_dash_direction(input)
		apply_burst()
		dir_set = true 
		if was_airborne and AIR_DASH_GRAVITY_FROZEN and works_less_than(AIR_DASH_DURA):
			player.velocity.y = 0 
		var speed = AIR_DASH_VEL if was_airborne else GROUND_DASH_VEL
		player.velocity.x = dash_dir.x * speed
		player.velocity.z = dash_dir.z * speed
		player.move_and_slide()
	
	
func apply_burst():
	var speed = AIR_DASH_VEL if was_airborne else GROUND_DASH_VEL
	player.velocity.x = dash_dir.x * speed
	player.velocity.z = dash_dir.y * speed
	if not was_airborne:
		player.velocity.y = 0
		
func get_dash_direction(input : InputPackage) -> Vector3:
	if input.input_direction != Vector2.ZERO:
		return ( player.transform.basis * Vector3(input.input_direction.x , 0 , input.input_direction.y ).normalized())
	return -player.transform.basis.z.normalized()
	
	# Delete comments if bothered c:
