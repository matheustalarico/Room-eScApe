extends Control


class_name InteractWindow


func _enter_tree() -> void:
	#hide_window()
	pass


func show_window() -> void:
	show()
	mouse_filter = Control.MOUSE_FILTER_STOP


func hide_window() -> void:
	hide()
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	#print("Im hiding!!")


func _on_arrow_button_pressed() -> void:
	hide_window()
