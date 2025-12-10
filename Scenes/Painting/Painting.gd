extends TextureButton

class_name Painting

@export var painting_type: int = 1
@export var is_a_button: bool = false

const Paintings: Dictionary[int, Texture2D] = {
	1: preload("res://Assets/wall_2/painting_1.png"),
	2: preload("res://Assets/wall_2/painting_2.png"),
	3: preload("res://Assets/wall_2/painting_3.png")
}

func _ready() -> void:
	if is_a_button == false:
		mouse_default_cursor_shape = Control.CURSOR_ARROW
		mouse_filter = Control.MOUSE_FILTER_IGNORE
	change_painting_sprite()


func change_painting_sprite() -> void:
	texture_normal = Paintings[painting_type]

func _on_pressed() -> void:
	SignalHub.emit_on_painting_clicked(painting_type)
