extends VBoxContainer

func _on_add_dot_pressed() -> void:
	if %Dot_x.text == "" or %Dot_y.text == "":
		$Feedback.add_feedback("o(s) campos não podem estar vazios")
		return
	
	if abs(float(%Dot_x.text)) > %Enemy.max_x:
		$Feedback.add_feedback("o valor x excede o limite do grafico")
		return
	
	if abs(float(%Dot_y.text)) > %Enemy.max_y:
		$Feedback.add_feedback("o valor y excede o limite do grafico")
		return
	
	if get_active_bar() == 0:
		%Player.add_point(Vector2(float(%Dot_x.text),float(%Dot_y.text)))
		%AddDotMenu.visible = not %AddDotMenu.visible
		%AddDot.disabled = not %AddDot.disabled
	else:
		%Enemy.add_point(Vector2(float(%Dot_x.text),float(%Dot_y.text)))
		%AddDotMenu.visible = not %AddDotMenu.visible
		%AddDot.disabled = not %AddDot.disabled
	
func get_active_bar() -> int:
	return %TabBar.current_tab
	
