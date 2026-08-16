extends Node
class_name Move


# all-move flags and variables here
var player : CharacterBody3D
var animation: String 
var enter_state_time: float 
var move_name : String
var has_queued_move : bool = false
var queued_move : String = "none, drop error "

var has_forced_move : bool = false
var forced_move : String = 'none, drop error'

static var moves_priority : Dictionary = {
	"idle" : 1,
	"run" : 2,
	"sprint" : 3,
	"jump_run" : 10,
	"midair" : 10,
	"landing_run" : 10,
	"jump_sprint" : 10,
	"landing_sprint" : 10,
	"slash_1" : 15,
	"slash_2" : 15,
	"slash_3" :15,
	"air_slash_1": 15,  
}


static func moves_priority_sort(a : String, b : String):
	if moves_priority[a] > moves_priority[b]:
		return true
	else:
		return false


func check_relevance(input : InputPackage) -> String:
	if has_forced_move:
		has_forced_move = false
		return forced_move
	return default_lifecycle(input)


func default_lifecycle( _input : InputPackage) -> String:
	print_debug("error, implement default_lifecycle")
	return "error, implement default_lifecycle"
	

func try_forced_move(new_forced_move : String ):
	if not has_forced_move:
		has_forced_move = true 
		forced_move = new_forced_move
	elif moves_priority[new_forced_move] >= moves_priority[forced_move]:
		forced_move = new_forced_move

func update(input : InputPackage, delta : float):
	pass


func on_enter_state():
	pass

func on_exit_state():
	pass
	
func mark_enter_state():
	enter_state_time = Time.get_unix_time_from_system()
	
func get_progress() -> float:
	var now = Time.get_unix_time_from_system()
	return now - enter_state_time
	
func works_longer_than(time: float)->bool:
	if get_progress() >= time:
		return true
	return false 
func works_less_than(time:float) -> bool:
	if get_progress() <time:
		return true
	return false
	
func works_between(start: float, finish: float)-> bool:
	var progress = get_progress()
	if progress >=start and progress <=finish:
		return true
	return false
	
func check_combos( input : InputPackage):
	var avaliable_combos = get_children()
	for combo : Combo in avaliable_combos:
		if combo.is_triggered(input):
			has_queued_move = true 
			queued_move = combo.triggered_move
			return
			
func form_hit_data(_weapon : Weapon) -> HitData:
	return HitData.new()
	

func react_on_hit(hit: HitData):
	try_forced_move("staggered")
	hit.queue_free()
	
