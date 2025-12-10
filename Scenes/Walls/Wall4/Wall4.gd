extends WallBase


@onready var hammer: TextureButton = $Hammer
@onready var hidden_text_window: InteractWindow = $Windows/HiddenTextWindow
@onready var board_window: InteractWindow = $Windows/BoardWindow


func _on_board_pressed() -> void:
	board_window.show_window()


func _on_hammer_pressed() -> void:
	hammer.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hammer.mouse_default_cursor_shape = Control.CURSOR_ARROW
	hammer.hide()
	SignalHub.emit_on_hammer_collected()


func _on_hidden_text_pressed() -> void:
	hidden_text_window.show_window()
