extends WallBase


@onready var wall_sign: TextureButton = $WallSign
@onready var door_closed: TextureButton = $Door/DoorClosed
@onready var door_open: TextureRect = $Door/DoorOpen

@onready var sign_window: Control = $Windows/SignWindow
@onready var text_window: InteractWindow = $Windows/TextWindow

const SIGN_REMOVED = preload("res://Assets/wall_1/sign_removed.png")
const DOOR_BROKEN = preload("res://Assets/wall_1/door_broken.png")

@export var sign_password: Array[int] = [ 0, 5, 2, 4, 0, 9, 2, 0 ]

func _enter_tree() -> void:
	super._enter_tree()
	SignalHub.on_screw_removed.connect(on_screw_removed)
	SignalHub.on_sign_password_complete.connect(on_sign_password_complete)


func detect_door_interactable() -> void:
	if door_open.visible and GameManager._has_hammer:
		door_closed.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND


func on_screw_removed() -> void:
	if GameManager.screws_removed >= 4:
		wall_sign.texture_normal = SIGN_REMOVED


func _on_wall_sign_pressed() -> void:
	sign_window.show_window()


func on_sign_password_complete(password: Array[int]) -> void:
	if password == sign_password:
		SoundManager.play_correct(sound)
		door_open.show()
		detect_door_interactable()
	else:
		SoundManager.play_wrong(sound)


func on_hammer_collected() -> void:
	super.on_hammer_collected()
	detect_door_interactable()

func _on_door_closed_pressed() -> void:
	if door_open.visible and GameManager._has_hammer:
		door_open.texture = DOOR_BROKEN
		SignalHub.emit_on_game_finished()


func _on_text_trigger_pressed() -> void:
	text_window.show_window()
