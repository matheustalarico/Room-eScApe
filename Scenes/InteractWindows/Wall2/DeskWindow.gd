extends InteractWindow


const DRAWER_CLOSED = preload("res://Assets/close_ups/drawer_closed.png")
const DRAWER_OPEN = preload("res://Assets/close_ups/drawer_open.png")


@onready var drawer_texture: TextureRect = $DrawerTexture
@onready var drawer_trigger_closed: TextureButton = $DrawerTexture/DrawerTriggerClosed
@onready var drawer_trigger_open: TextureButton = $DrawerTexture/DrawerTriggerOpen
@onready var note_trigger: TextureButton = $DrawerTexture/NoteTrigger
@onready var drawer_note_window: InteractWindow = $DrawerNoteWindow


func _ready() -> void:
	SignalHub.on_desk_clicked.connect(on_desk_clicked)
	close_drawer()


func open_drawer() -> void:
	drawer_texture.texture = DRAWER_OPEN
	drawer_trigger_closed.mouse_filter = Control.MOUSE_FILTER_IGNORE
	drawer_trigger_open.mouse_filter = Control.MOUSE_FILTER_STOP
	note_trigger.mouse_filter = Control.MOUSE_FILTER_STOP


func close_drawer() -> void:
	drawer_texture.texture = DRAWER_CLOSED
	drawer_trigger_closed.mouse_filter = Control.MOUSE_FILTER_STOP
	drawer_trigger_open.mouse_filter = Control.MOUSE_FILTER_IGNORE
	note_trigger.mouse_filter = Control.MOUSE_FILTER_IGNORE


func _on_drawer_trigger_closed_pressed() -> void:
	open_drawer()


func _on_drawer_trigger_open_pressed() -> void:
	close_drawer()


func _on_note_trigger_pressed() -> void:
	drawer_note_window.show_window()


func on_desk_clicked() -> void:
	close_drawer()
