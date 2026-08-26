extends Node
class_name Player_Model


@onready var player = $".."

@onready var skeleton: Skeleton3D = %Skeleton3D
@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var combat = $combat as player_combat

@onready var active_weapon : Weapon = $rightWrist/socketweapon/sword as Sword

var current_move : Move


@onready var moves = {
	"idle" : $states/idle,
	"run" : $states/run,
	"sprint": $states/sprint, 
	"jump" : $states/jump,
	"jump_run": $states/JumpRun,
	"midair": $states/midair,
	"landing_run":$states/LandingRun,
	"landing_sprint":$states/LandingSprint,
	"air_slash_1": $states/air_slash,
	"slash_1": $states/slash_1 , 
	"slash_2": $states/slash_2 , 
	"slash_3": $states/slash_3,
	"staggered": $states/staggered,
	"dash" : $states/dash,
}


func _ready():
	current_move = moves["idle"]
	for move in moves.values():
		move.player = player


func update(input : InputPackage, delta : float):
	input = combat.translate_combat_actions(input)
	var relevance = current_move.check_relevance(input)
	if relevance != "okay":
		switch_to(relevance)
	current_move.update(input, delta)
	


func switch_to(state : String):
	current_move.on_exit_state()
	current_move = moves[state]
	current_move.on_enter_state()
	current_move.mark_enter_state()
	animator.play(current_move.animation)
