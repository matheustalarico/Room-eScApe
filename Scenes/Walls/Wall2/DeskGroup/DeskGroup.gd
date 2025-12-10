extends Control


func on_triggers_pressed() -> void:
	SignalHub.emit_on_desk_clicked()
