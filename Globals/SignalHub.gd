extends Node


signal on_arrow_pressed(new_wall: int)


signal on_screw_removed
signal on_digit_button_pressed(digit_number: int)
signal on_sign_password_complete(password: Array[int])
signal on_hammer_collected


signal on_painting_input_changed(digit_number: int, painting_type: int)
signal on_painting_clicked(painting_type: int)
signal on_desk_clicked
signal on_screwdriver_collected


signal on_storage_screw_removed
signal on_safe_digit_button_pressed(digit_number: int)
signal on_safe_password_complete(password: Array[int])


signal on_game_finished


func emit_on_arrow_pressed(new_wall: int) -> void:
	on_arrow_pressed.emit(new_wall)


func emit_on_screw_removed() -> void:
	on_screw_removed.emit()
func emit_on_digit_button_pressed(digit_number: int) -> void:
	on_digit_button_pressed.emit(digit_number)
func emit_on_sign_password_complete(password: Array[int]) -> void:
	on_sign_password_complete.emit(password)
func emit_on_hammer_collected() -> void:
	on_hammer_collected.emit()


func emit_on_painting_input_changed(digit_number: int, painting_type: int) -> void:
	on_painting_input_changed.emit(digit_number, painting_type)
func emit_on_painting_clicked(painting_type: int) -> void:
	on_painting_clicked.emit(painting_type)
func emit_on_desk_clicked() -> void:
	on_desk_clicked.emit()
func emit_on_screwdriver_collected() -> void:
	on_screwdriver_collected.emit()


func emit_on_storage_screw_removed() -> void:
	on_storage_screw_removed.emit()
func emit_on_safe_digit_button_pressed(digit_number: int) -> void:
	on_safe_digit_button_pressed.emit(digit_number)
func emit_on_safe_password_complete(password: Array[int]) -> void:
	on_safe_password_complete.emit(password)

func emit_on_game_finished() -> void:
	on_game_finished.emit()
