extends Node
class_name PlayerVisuals

@onready var model : Player_Model

@onready var beta_surface = $Beta_Surface
@onready var beta_joints = $Beta_Joints

@onready var sword_Visuals = $SwordVisusals

func accept_model(_model : Player_Model):
	model = _model
	beta_surface.skeleton = _model.skeleton.get_path()
	beta_joints.skeleton = _model.skeleton.get_path()

func _process(_delta):
	adjust_weapon_visuals()

func adjust_weapon_visuals():
	sword_Visuals.global_transform = model.active_weapon.global_transform
