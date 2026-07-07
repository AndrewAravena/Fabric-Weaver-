extends AnimationPlayer

func _ready():
	Configure_blending_times()

func Configure_blending_times():
	set_blend_time("Run", "Jumping", 0.5)
