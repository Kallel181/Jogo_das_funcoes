extends VBoxContainer


func _on_add_line_button_pressed():
	for i in [%StartX, %StartY, %EndX, %EndY]:
		if i.text == "":
			$Feedback.add_feedback("Os campos devem conter algo")
			return
	
	for i in [%StartX, %StartY, %EndX, %EndY]:
		if abs(float(i.text)) > 15:
			$Feedback.add_feedback("Os limites do grafico são de -15 a 15")
			return
	
	var startx = float(%StartX.text)
	var starty = float(%StartY.text)
	var endx = float(%EndX.text)
	var endy = float(%EndY.text)
	
	if get_active_bar() == 0:
		%Player.add_line(Vector2(startx,starty),Vector2(endx,endy))
	else:
		%Enemy.add_line(Vector2(startx,starty),Vector2(endx,endy))
	
	%AddLineButton.disabled = not %AddLineButton.disabled
	%AddLineMenu.visible = not %AddLineMenu.visible
	
func get_active_bar() -> int:
	return %TabBar.current_tab
	
