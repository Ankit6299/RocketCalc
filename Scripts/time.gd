extends Label

func _ready() -> void:
	$"60SecsTimer".start()

func _process(delta: float) -> void:
	text = "Time: "+str(int($"60SecsTimer".get_time_left()))
	pass

func _on_secs_timer_timeout() -> void:
	pass # Replace with function body.
