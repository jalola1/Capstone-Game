extends Node2D

func _ready() -> void:
	if $IntroMusicContinued and !$IntroMusicContinued.playing:
		$IntroMusicContinued.play()

func _on_startbutton_pressed():
	$EnterGameSound.play()
	
	
func _on_next_button_sound_finished() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
