extends Label


var init_text: String = "Wall: %d"


func _enter_tree() -> void:
	text = init_text % 1
	SignalHub.on_arrow_pressed.connect(on_arrow_pressed)


func on_arrow_pressed(new_wall: int):
	text = init_text % new_wall
