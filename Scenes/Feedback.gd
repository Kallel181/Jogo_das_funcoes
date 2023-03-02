extends Label

func add_feedback(line:String):
	text = line
	%Timer.start()


func _on_timer_timeout() -> void:
	text = ""
