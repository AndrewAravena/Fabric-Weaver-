extends Move
class_name  staggered #Redifine your class_name

const ANIMATION_END := 0.6



#Redefine your overriden parameters 
func _ready() -> void:
	animation = "asasdasd"
	move_name = "staggered"
#Implement a chechk relevance function


func default_lifecycle( input : InputPackage):
	if works_longer_than(ANIMATION_END):
		input.actions.sort_custom(moves_priority_sort)
		return input.actions[0]
	return "okay"
	
	
	# implement an update function
func update(input : InputPackage, delta : float):
	pass
	
	
	# Delete comments if bothered c:
