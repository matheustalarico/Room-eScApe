extends TextureButton


@export var n: int = -1

@onready var number: Label = $Number
@onready var sound: AudioStreamPlayer = $Sound


func _ready() -> void:
	number.text = "%d" % n


func _on_pressed() -> void:
	sound.play()
	SignalHub.emit_on_safe_digit_button_pressed(n)
