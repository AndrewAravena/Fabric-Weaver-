extends Move
class_name  AirSlash1
#Redifine your class_name
#Redefine your overriden parameters 

const  ATTACK_DURATION := 0.5
func _ready() -> void:
	animation = "asasdasd"
	move_name = "air_slash_1"
	
func on_enter_state():
	player.velocity.y = 0 

#Implement a chechk relevance function
func default_lifecycle( input : InputPackage):
	if works_longer_than(ATTACK_DURATION):
		return "midair"
	return "okay"
	
	
	# implement an update function
func update(input : InputPackage, delta : float):
	player.velocity.y = 0 
	player.move_and_slide()
	
	# Delete comments if bothered c:
