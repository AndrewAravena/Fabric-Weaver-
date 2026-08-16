extends Move
class_name  AirSlash1
#Redifine your class_name
#Redefine your overriden parameters 

const  ATTACK_DURATION := 0.5
func _ready() -> void:
	animation = "asasdasd"
	move_name = "air_slash_1"

#Implement a chechk relevance function
func check_relevance(input : InputPackage):
	if works_longer_than(ATTACK_DURATION):
		return "midair"
	return "okay"
	
	
	# implement an update function
func update(input : InputPackage, delta : float):
	player.velocity.y -= ProjectSettings.get_setting("physics/3d/default_gravity") * delta * 0.5
	player.move_and_slide()
	
	# Delete comments if bothered c:
