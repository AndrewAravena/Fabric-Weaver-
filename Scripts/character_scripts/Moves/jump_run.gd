extends Move
class_name  JumpRun
#Redifine your class_name

const VERTICAL_SPEED_ADDED: float = 5.0

const TRANSITIONAL_TIMING:= 0.44
const JUMP_TIMING:= 0.1
#Redefine your overriden parameters 

var jumped : bool = false 

func _ready() -> void:
	animation = "Armature|Jumping"
	move_name = "jump_run"

#Implement a chechk relevance function
func check_relevance(input : InputPackage):
	if works_longer_than(TRANSITIONAL_TIMING):
		jumped = false 
		return "midair"
	else:
		return "okay"
	
	
	# implement an update function
func update(input : InputPackage, delta : float):
	if works_longer_than(JUMP_TIMING):
		if not jumped:
			player.velocity.y += VERTICAL_SPEED_ADDED
			jumped = true
	player.move_and_slide()
	
	
	# Delete comments if bothered c:
