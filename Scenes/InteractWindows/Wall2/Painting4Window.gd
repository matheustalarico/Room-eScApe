extends InteractWindow


@onready var screwdriver: TextureButton = $Screwdriver


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _on_screwdriver_pressed() -> void:
	screwdriver.mouse_filter = Control.MOUSE_FILTER_IGNORE
	screwdriver.mouse_default_cursor_shape = Control.CURSOR_ARROW
	screwdriver.hide()
	SignalHub.emit_on_screwdriver_collected()
	GameManager.pick_screwdriver()
