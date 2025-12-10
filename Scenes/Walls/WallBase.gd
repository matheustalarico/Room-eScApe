extends Control


class_name WallBase


@onready var sound: AudioStreamPlayer = $Sound
@onready var label: Label = $Label


@export var wall_number: int = 0


func _enter_tree() -> void:
	SignalHub.on_arrow_pressed.connect(on_arrow_pressed)
	SignalHub.on_hammer_collected.connect(on_hammer_collected)
	SignalHub.on_screwdriver_collected.connect(on_screwdriver_collected)


func _on_arrow_left_pressed() -> void:
	var next_wall: int = wall_number - 1
	if next_wall <= 0:
		next_wall = 4
	SignalHub.emit_on_arrow_pressed(next_wall)


func _on_arrow_right_pressed() -> void:
	var next_wall: int = wall_number + 1
	if next_wall >= 5:
		next_wall = 1
	SignalHub.emit_on_arrow_pressed(next_wall)


func on_arrow_pressed(new_wall: int):
	if wall_number == new_wall:
		show()
	else:
		hide()


func on_hammer_collected() -> void:
	label.text += "  Martelo "


func on_screwdriver_collected() -> void:
	label.text += "  Chave de Fenda "
