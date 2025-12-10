extends InteractWindow


@onready var texture_rect: TextureRect = $TextureRect
@onready var sign_coder: Control = $SignCoder
@onready var text: VBoxContainer = $Text


const SIGN_1_OPEN = preload("res://Assets/close_ups/sign_1_open.png")


func _enter_tree() -> void:
	SignalHub.on_screw_removed.connect(on_screw_removed)


func on_screw_removed() -> void:
	if GameManager.screws_removed >= 4:
		texture_rect.texture = SIGN_1_OPEN
		sign_coder.show()
		text.hide()
