extends Node2D


@export var move: float = 100.0


func _input(_event: InputEvent) -> void:
	camera_control()

func camera_control() -> void:
	if not $"..".is_active:
		return
	
	if Input.is_action_just_pressed("w"):
		if position.y > $"..".max_y*$"..".step*-1:
			position.y -= move
	elif Input.is_action_just_pressed("s"):
		if position.y < $"..".max_y*$"..".step:
			position.y += move
	elif Input.is_action_just_pressed("d"):
		if position.x < $"..".max_x*$"..".step:
			position.x += move
	elif Input.is_action_just_pressed("a"):
		if position.x > $"..".max_x*$"..".step*-1:
			position.x -= move
	
	if Input.is_action_just_pressed("f"):
		position = Vector2(0,0)
