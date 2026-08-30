extends Move
class_name  JumpRun
#Redifine your class_name

const VERTICAL_SPEED_ADDED: float = 5.0

const TRANSITIONAL_TIMING:= 0.33
const JUMP_TIMING:= 0.1
#Redefine your overriden parameters 

var jumped : bool = false 

func _ready() -> void:
	animation = "Armature|Jumping"
	move_name = "jump_run"

#Implement a chechk relevance function
func default_lifecycle( input : InputPackage):
	if works_longer_than(TRANSITIONAL_TIMING):
		jumped = false 
		return "midair"
	
		
	if not input.actions.is_empty():
		input.actions.sort_custom(moves_priority_sort)
		if input.actions[0] != move_name and moves_priority[input.actions[0]] > moves_priority[move_name] :
			return input.actions[0]
	return "okay"
		
	
	
	# implement an update function
func update(input : InputPackage, delta : float):
	if works_longer_than(JUMP_TIMING):
		if not jumped:
			player.velocity.y += VERTICAL_SPEED_ADDED
			jumped = true
	player.move_and_slide()
	
	
	# Delete comments if bothered c:
