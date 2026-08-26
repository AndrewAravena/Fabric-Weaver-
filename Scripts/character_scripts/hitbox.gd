extends Area3D
class_name Hitbox

@onready var model = $"../.." as Player_Model

func _ready() -> void:
	area_entered.connect(on_contact)


func on_contact(area : Area3D):
	if is_eligible_attacking_weapon(area):
		area.hitbox_ignore_list.append(self)
		model.current_move.react_on_hit(area.get_hit_data())

func is_eligible_attacking_weapon(area : Area3D)-> bool:
	if area is Weapon and area != model.active_weapon and not area.hitbox_ignore_list.has(self) and area.is_attacking:
		return true
	return false 
