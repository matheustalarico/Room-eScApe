extends Node


var _has_screwdriver: bool = false
var screws_removed: int = 0
var screws_storage_wall_removed: int = 0


var _has_hammer: bool = false


func _enter_tree() -> void:
	SignalHub.on_screw_removed.connect(on_screw_removed)
	SignalHub.on_storage_screw_removed.connect(on_storage_screw_removed)
	SignalHub.on_hammer_collected.connect(on_hammer_collected)

func pick_screwdriver() -> void:
	_has_screwdriver = true

func on_hammer_collected() -> void:
	_has_hammer = true


func on_screw_removed() -> void:
	screws_removed += 1

func on_storage_screw_removed() -> void:
	screws_storage_wall_removed += 1
