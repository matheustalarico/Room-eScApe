extends TextureButton


class_name StorageScrew

@onready var sound: AudioStreamPlayer = $Sound

func _on_pressed() -> void:
	if GameManager._has_screwdriver:
		sound.play()
		hide()
		mouse_filter = Control.MOUSE_FILTER_IGNORE
		SignalHub.emit_on_storage_screw_removed()
