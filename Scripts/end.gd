extends Control
@onready var your_score = $ColorRect/MarginContainer/VBoxContainer/YourScore
@onready var game_on = $game
func _ready() -> void:
	your_score.text = "You Scored: " + str(Global.score)

func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
