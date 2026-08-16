extends Move
class_name PlungeAttack   # <-- rename per attack (Fabric dash .... )

# ready: identify this move
const PLUNGE_SPEED := -20.0    
const MIN_DURATION := 0.9  

func _ready():
	animation = "attack_name"   # <-- set per attack
	move_name = "attack_name"   # <-- must match the key in model.gd's `moves` dict


func on_enter_state():
	player.velocity.y = PLUNGE_SPEED
	player.velocity.x = 0 
	player.velocity.z = 0 
	
	
# check: has this move ended, and was a follow-up combo triggered?
func default_lifecycle( input : InputPackage):
	if player.is_on_floor() and works_longer_than(MIN_DURATION):
		return "idle"
	return "okay "

func update(input : InputPackage, delta : float):
	player.move_and_slide()
