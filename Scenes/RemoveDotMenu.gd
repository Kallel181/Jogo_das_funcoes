extends VBoxContainer

func _on_remove_dot_pressed():
	if %Dot_x_rm.text == "" or %Dot_y_rm.text == "":
		$Feedback.add_feedback("o(s) campos não podem estar vazios")
		return
	
	if abs(float(%Dot_x_rm.text)) > %Enemy.max_x:
		$Feedback.add_feedback("o valor x excede o limite do grafico")
		return
	
	if abs(float(%Dot_y_rm.text)) > %Enemy.max_y:
		$Feedback.add_feedback("o valor y excede o limite do grafico")
		return
	
	var x = float(%Dot_x_rm.text)
	var y = float(%Dot_y_rm.text)
	
	if get_active_bar() == 0:
		%Player.remove_point(Vector2(x,y))
	else:
		%Enemy.remove_point(Vector2(x,y))
	
	%RemoveDot.disabled = not %RemoveDot.disabled
	%RemoveDotMenu.visible = not %RemoveDotMenu.visible
	
func get_active_bar() -> int:
	return %TabBar.current_tab
	
