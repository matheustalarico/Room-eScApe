extends Node


const SOUND_CLICK: String = "click"
const SOUND_CORRECT: String = "correct"
const SOUND_WRONG: String = "wrong"

const SOUNDS: Dictionary[String, AudioStream] = {
	SOUND_CLICK: preload("res://Assets/Sounds/mouseclick.wav"),
	SOUND_CORRECT: preload("res://Assets/Sounds/24.wav"),
	SOUND_WRONG: preload("res://Assets/Sounds/losetrumpet.mp3")
}


func play_sound(source: AudioStreamPlayer, key: String) -> void:
	if SOUNDS.has(key) == false:
		return
	
	source.stop()
	source.stream = SOUNDS[key]
	source.play()


func play_click(source: AudioStreamPlayer) -> void:
	play_sound(source, "click")


func play_wrong(source: AudioStreamPlayer) -> void:
	play_sound(source, "wrong")


func play_correct(source: AudioStreamPlayer) -> void:
	play_sound(source, "correct")
