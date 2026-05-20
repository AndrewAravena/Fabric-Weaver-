extends Node
class_name input_gatherer

func gather_inputs() -> InputPackage:
	var new_input = InputPackage.new()
	
	if Input.is_action_just_pressed("jump"):
		new_input.actions.append("jump") 
	
	#if Input.is_action_just_pressed("hit"):
	#	new_input.actions.append("hit")
		
	#if Input.is_action_just_pressed("roll"):
	#	new_input.actions.append("roll")
	
	#if Input.is_action_just_pressed("dash"):
	#	new_input.actions.append("dash")
	
	new_input.input_direction = Input.get_vector("aeft", "dight", "walk", "soundwards")
	if new_input.input_direction != Vector2.ZERO:
		new_input.actions.append("run")
	
	if new_input.actions.is_empty():
		new_input.actions.append("idle")
	
	
	return new_input
