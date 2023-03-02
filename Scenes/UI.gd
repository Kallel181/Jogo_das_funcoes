extends Control

var questions:Array = [
	"Teste1",
	"Teste2",
	"Teste3",
	"Teste4",
	"Teste5",
	"Teste6",
	"Teste7"
]
#======================================== Built In ========================================
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("mouse_2"):
		%ButtonSelect.visible = not %ButtonSelect.visible
		%AddPoint.disabled = not %AddPoint.disabled
		%AddLine.disabled = not %AddLine.disabled
		%ClearPoint.disabled = not %ClearPoint.disabled
		%ClearAllPoints.disabled = not %ClearAllPoints.disabled






#======================================== Signals ========================================
#change tab
func _on_tab_bar_tab_changed(tab: int) -> void:
	%Player_Graph.visible = not %Player_Graph.visible
	%Player.is_active = not %Player.is_active
	
	%Enemy_Graph.visible = not %Enemy_Graph.visible
	%Enemy.is_active = not %Enemy.is_active

#display question
func _on_question_pressed() -> void:
	pass # Replace with function body.



func _on_add_point_pressed() -> void:
	revoke_disable_visibility()
	%AddDotMenu.visible = not %AddDotMenu.visible
	%AddDot.disabled = not %AddDot.disabled


func _on_add_line_pressed() -> void:
	revoke_disable_visibility()


func _on_clear_point_pressed() -> void:
	revoke_disable_visibility()


func _on_clear_all_points_pressed() -> void:
	revoke_disable_visibility()



func get_active_bar() -> int:
	return %TabBar.current_tab

func revoke_disable_visibility() -> void:
	%ButtonSelect.visible = not %ButtonSelect.visible
	%AddPoint.disabled = not %AddPoint.disabled
	%AddLine.disabled = not %AddLine.disabled
	%ClearPoint.disabled = not %ClearPoint.disabled
	%ClearAllPoints.disabled = not %ClearAllPoints.disabled

