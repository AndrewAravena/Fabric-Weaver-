extends CharacterBody3D

@onready var _camera_pivot: Node3D = $CameraPivot
@onready var _camera_3d: Camera3D = $CameraPivot/SpringArm3D/Camera3D
@onready var character_body_3d: CharacterBody3D = $"."

@export_range(0.0, 1.0) var mouse_sensitivity = 0.01
@export var tilt_limit = deg_to_rad(75)

@export_group("movement")
@export var move_speed := 100.0
@export var acceleration := 9.80

@onready var model = $model as Player_Model
@onready var input_gatherer = $input as input_gatherer

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
	
	if event is InputEventMouseMotion:
		_camera_pivot.rotation.x -= event.screen_relative.y * mouse_sensitivity
		_camera_pivot.rotation.x = clampf(_camera_pivot.rotation.x, -tilt_limit, tilt_limit)
		rotation.y += -event.screen_relative.x * mouse_sensitivity

func _physics_process(delta: float) -> void:
	var input = input_gatherer.gather_inputs()
	model.update(input, delta)
	
	if Input.is_action_just_pressed("pause"):
		get_tree().quit()
	move_and_slide()
