extends CharacterBody3D

@onready var _camera_pivot: Node3D = $CameraPivot
@onready var _camera_3d: Camera3D = $CameraPivot/SpringArm3D/Camera3D
@onready var character_body_3d: CharacterBody3D = $"."

@export_range(0.0, 1.0) var mouse_sensitivity = 0.01
@export var tilt_limit = deg_to_rad(75)

@export_group("movement")
@export var move_speed := 10.0
@export var acceleration := 50.0
const FRICTION = 10.0
const VELOCITY = 100.0
const GRAVITY = -9.8


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _unhandled_input(event: InputEvent) -> void:
	
	if event is InputEventMouseMotion:
		_camera_pivot.rotation.x -= event.screen_relative.y * mouse_sensitivity
		_camera_pivot.rotation.x = clampf(_camera_pivot.rotation.x, -tilt_limit, tilt_limit)
		rotation.y += -event.screen_relative.x * mouse_sensitivity
		
		
func _physics_process(delta: float) -> void:
	var input_vec = Input.get_vector("aeft","dight","walk","soundwards")
	var move_dir = (transform.basis * Vector3(input_vec.x, 0, input_vec.y)).normalized()
	move_dir.y = 0.0
	move_dir = move_dir.normalized()
	velocity = velocity.move_toward(move_dir * move_speed , acceleration * delta)
	
	move_and_slide()


		
		
	
		
