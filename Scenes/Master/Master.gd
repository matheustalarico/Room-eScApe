extends Control


const GAME_OVER_SCREEN = preload("res://Scenes/GameOverScreen/GameOverScreen.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_game_finished.connect(on_game_finished)


func on_game_finished() -> void:
	var gos = GAME_OVER_SCREEN.instantiate()
	add_child(gos)
	get_tree().paused = true
