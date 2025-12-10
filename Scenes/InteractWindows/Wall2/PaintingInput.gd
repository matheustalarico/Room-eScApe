extends Control


class_name PaintingInput


@export var painting_type: int = 0


var digit: int = 0:
	get:
		return digit
	set(new_digit):
		if new_digit < 0:
			new_digit = 9
		elif new_digit > 9:
			new_digit = 0
		digit = new_digit


@onready var label: Label = $Label


func update_label() -> void:
	label.text = "%d" % digit
	SignalHub.emit_on_painting_input_changed(digit, painting_type)


func _on_arrow_button_left_pressed() -> void:
	digit -= 1
	update_label()


func _on_arrow_button_right_pressed() -> void:
	digit += 1
	update_label()
