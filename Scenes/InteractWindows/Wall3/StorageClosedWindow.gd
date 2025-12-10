extends InteractWindow

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_storage_screw_removed.connect(on_storage_screw_removed)


func on_storage_screw_removed() -> void:
	if GameManager.screws_storage_wall_removed >= 2:
		hide_window()
