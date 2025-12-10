extends Control


@onready var timer: Timer = $Timer
@onready var hb_container: HBoxContainer = $CodeScreen/HBContainer


const _50_BLACK = preload("res://Resources/50black.tres")
const _50_WHITE = preload("res://Resources/50white.tres")

var digits: Array[int] = [ 0, 0, 0, 0, 0, 0 ]
var current_digit: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_safe_digit_button_pressed.connect(on_safe_digit_button_pressed)
	write_on_screen()


func write_on_screen() -> void:
	for digit in hb_container.get_children():
		if digit is Digit:
			var digit_number = digit.digit
			digit.text = "%d" % digits[digit_number]
			if digit_number == current_digit:
				digit.label_settings = _50_WHITE
			else:
				digit.label_settings = _50_BLACK


func on_safe_digit_button_pressed(digit_number: int) -> void:
	if current_digit <= 5:
		digits[current_digit] = digit_number
		current_digit += 1
		write_on_screen()
		
		if current_digit == 6:
			SignalHub.emit_on_safe_password_complete(digits)
			timer.start()


func _on_timer_timeout() -> void:
	current_digit = 0
	digits = [ 0, 0, 0, 0, 0, 0 ]
	write_on_screen()
	
