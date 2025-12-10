extends WallBase


@onready var note_window: InteractWindow = $Windows/NoteWindow
@onready var storage_closed_window: InteractWindow = $Windows/StorageClosedWindow
@onready var safe_window: SafeWindow = $Windows/SafeWindow
@onready var storage_open_window: InteractWindow = $Windows/StorageOpenWindow
@onready var safe_open: TextureRect = $Safe/SafeOpen
@onready var storage_open: TextureRect = $Storage/StorageOpen


func _ready() -> void:
	SignalHub.on_safe_password_complete.connect(on_safe_password_complete)
	SignalHub.on_storage_screw_removed.connect(on_storage_screw_removed)


func _on_note_pressed() -> void:
	note_window.show_window()


func _on_safe_pressed() -> void:
	safe_window.show_window()


func _on_storage_pressed() -> void:
	if storage_open.visible:
		storage_open_window.show_window()
	else:
		storage_closed_window.show_window()


func on_safe_password_complete(password: Array[int]) -> void:
	if safe_window.target_password == password:
		safe_open.show()


func on_storage_screw_removed() -> void:
	if GameManager.screws_storage_wall_removed >= 2:
		storage_open.show()
