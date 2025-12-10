extends TextureButton


class_name Screw


@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _on_pressed() -> void:
	if GameManager._has_screwdriver:
		audio_stream_player.play()
		hide()
		mouse_filter = Control.MOUSE_FILTER_IGNORE
		SignalHub.emit_on_screw_removed()
