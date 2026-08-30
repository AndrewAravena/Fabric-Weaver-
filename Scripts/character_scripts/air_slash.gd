extends Move
class_name  AirSlash1
#Redifine your class_name
#Redefine your overriden parameters 
const ATTACK_DURA := 0.5
const AIR_ATTACK_DECEL := 12.0

const  ATTACK_DURATION := 0.5
func _ready() -> void:
	animation = "asasdasd"
	move_name = "air_slash_1"
	
func on_enter_state():
	player.velocity.y = 0 
	if player.model.previous_move_name == "dash":
		player.velocity.x = 0 
		player.velocity.z = 0 

#Implement a chechk relevance function
func default_lifecycle( input : InputPackage):
	if works_longer_than(ATTACK_DURATION):
		return "midair"
	return "okay"
	
	
	# implement an update function
func update(input : InputPackage, delta : float):	
	player.velocity.y = 0
	player.move_and_slide()
	player.velocity.y = 0
	player.velocity.x = move_toward(player.velocity.x , 0 , AIR_ATTACK_DECEL * delta) 
	player.velocity.z = move_toward(player.velocity.z , 0 , AIR_ATTACK_DECEL * delta) 
	# Delete comments if bothered c:
