extends InteractWindow


class_name SafeWindow


@export var target_password: Array[int] = [ 2, 1, 1, 1, 1, 1 ]


@onready var sound: AudioStreamPlayer = $Sound
@onready var texture_rect: TextureRect = $TextureRect
@onready var safe_trigger: TextureButton = $SafeTrigger
@onready var safe_inside_window: InteractWindow = $SafeInsideWindow


const SAFE_OPEN_CLOSE = preload("res://Assets/close_ups/safe_open_close.png")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_safe_password_complete.connect(on_safe_password_complete)


func on_safe_password_complete(password) -> void:
	if password == target_password:
		SoundManager.play_correct(sound)
		texture_rect.texture = SAFE_OPEN_CLOSE
		safe_trigger.mouse_filter = Control.MOUSE_FILTER_STOP
		safe_trigger.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	else:
		SoundManager.play_wrong(sound)


func _on_safe_trigger_pressed() -> void:
	safe_inside_window.show_window()
