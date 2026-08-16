extends Area3D
class_name Weapon

var hitbox_ignore_list : Array[Area3D]
var is_attacking : bool = false 

@export var holder : Player_Model


var basic_attacks: Dictionary
var air_attacks: Dictionary

#func get_hit_data() -> HitData:
#	return HitData.new()
