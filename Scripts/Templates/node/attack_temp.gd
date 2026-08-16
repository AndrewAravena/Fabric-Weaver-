extends Move
class_name AttackTemplate   # <-- rename per attack (Fabric dash .... )

# ready: identify this move
const COMBO_TIMING := 0.6       # how early a queued combo can fire (usually mid-swing)
const TRANSITION_TIMING := 0.9  # when this move ends if nothing was queued

func _ready():
	animation = "attack_name"   # <-- set per attack
	move_name = "attack_name"   # <-- must match the key in model.gd's `moves` dict

# check: has this move ended, and was a follow-up combo triggered?
func default_lifecycle( input : InputPackage):
	check_combos(input)  # asks each Combo child if its conditions are met
	if works_longer_than(COMBO_TIMING) and has_queued_move:
		has_queued_move = false
		return queued_move
	elif works_longer_than(TRANSITION_TIMING):
		input.actions.sort_custom(moves_priority_sort)
		return input.actions[0]
	else:
		return "okay"


func update(input : InputPackage, delta : float):
	if works_between(0.3 , 0.5): #place holder, change for attack frames on ani
		player.model.active_weapon.is_attacking = true 
	else: 
		player.model.active_weapon.is_attacking = false 


func form_hit_data( weapon : Weapon) -> HitData:
	var hit = HitData.new()
	hit.hit_move_ani = animation
	hit.weapon = weapon
	# hit.damage   havent added damage calcs yet 
	return hit 
	
func on_exit_state():
	player.model.active_weapon.hitbox_ignore_list.clear()
	player.model.active_weapon.is_attacking = false 

# optional: lock movement, apply lunge velocity, etc. on entering this swing
func on_enter_state():
	player.velocity = Vector3.ZERO
