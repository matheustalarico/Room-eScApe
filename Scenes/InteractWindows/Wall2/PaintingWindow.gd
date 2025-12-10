extends InteractWindow


class_name PaintingWindow


const NAMES: Dictionary[int, String] = {
	1: "R. L. Rivest",
	2: "A. Shamir",
	3: "L. M. Adleman"
}


@export var target_digit: int = -1
@export var painting_type: int = 0


@onready var painting_input: PaintingInput = $PaintingInput
@onready var painting: Painting = $Painting
@onready var label: Label = $Label


func _ready() -> void:
	painting_input.painting_type = painting_type
	painting.painting_type = painting_type
	painting.change_painting_sprite()
	label.text = NAMES[painting_type]
