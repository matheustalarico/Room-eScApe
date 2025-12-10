extends WallBase


@onready var windows: Control = $Windows
@onready var desk_window: Control = $Windows/DeskWindow
@onready var fourth_painting: TextureButton = $FourthPainting
@onready var painting_4_window: InteractWindow = $Windows/Painting4Window


@export var hidden_code: Array[int] = [ 7, 4, 9 ]
var current_code: Array[int] = [ 0, 0, 0 ]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_painting_input_changed.connect(on_painting_input_changed)
	SignalHub.on_painting_clicked.connect(on_painting_clicked)
	SignalHub.on_desk_clicked.connect(on_desk_clicked)


func detect_code() -> void:
	if current_code == hidden_code:
		sound.play()
		fourth_painting.show()
		fourth_painting.mouse_filter = Control.MOUSE_FILTER_STOP
		fourth_painting.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND


func on_painting_clicked(painting_type: int) -> void:
	for child in windows.get_children():
		if child is PaintingWindow:
			if child.painting_type == painting_type:
				child.show_window()


func on_desk_clicked() -> void:
	desk_window.show_window()


func on_painting_input_changed(digit_number: int, painting_type: int) -> void:
	current_code[painting_type - 1] = digit_number
	detect_code()


func _on_fourth_painting_pressed() -> void:
	painting_4_window.show_window()
