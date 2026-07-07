extends RayCast3D

@onready var root_attachment = $"../Root"

@onready var csg_sphere_3d_2 = $target_sphere

func _process(delta):
	global_position = root_attachment.global_position
	csg_sphere_3d_2.global_position = get_collision_point()
