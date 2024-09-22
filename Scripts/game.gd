extends Node2D
@onready var timer = $"UI/Head/MarginContainer/Time/60SecsTimer"
@onready var time_label = $UI/Head/MarginContainer/Time
@onready var question_label = $UI/Body/HBoxContainer/Question
@onready var answer_label = $UI/Body/HBoxContainer/Answer
@onready var score_label = $UI/Head/MarginContainer/Score

var score: int = 0
var num1: int
var num2: int
var correct_answer: int
var operators = ['+', '-', '*', '/']
var current_operator: String

func start_game():
	Global.score = 0
	update_question()
	update_ui()

func update_question():
	num2 = randi_range(1,10)
	num1 = randi_range(num2,10)
	
	current_operator = operators[randi_range(0, operators.size() - 1)]
	match current_operator:
		'+':
			correct_answer = num1 + num2
		'-':
			correct_answer = num1 - num2
		'*':
			correct_answer = num1 * num2
		'/':
			if num2 == 0:
				num2 = 1
			correct_answer = int(num1 / num2)
		
	question_label.text = str(num1)+str(current_operator)+str(num2)+"= "
func check_answer():
	if is_equal_approx(int(answer_label.text), correct_answer):
		print("EQUAL")
		Global.score+=10
		answer_label.text = ""
		update_question()
	else:
		answer_label.text = ""
	update_ui()

func update_ui():
	score_label.text = "Score: " + str(Global.score)
	time_label.text = "Time: " + str(int(timer.get_time_left()))

func _ready() -> void:
	timer.start()
	start_game()

func _process(delta: float) -> void:
	time_label.text = "Time: "+str(int(timer.get_time_left()))
	if int(timer.get_time_left()) > 0:
		time_label.text = "Time: " + str(int(timer.get_time_left()))
	else:
		get_tree().change_scene_to_file("res://Scenes/end.tscn")
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
#Keypad
func key_press(digit):
	if len(answer_label.text)<5:
		answer_label.text += str(digit)

func _on_seven_pressed():
	print("7 pressed")
	key_press(7)

func _on_eight_pressed() -> void:
	print("8 pressed")
	key_press(8)

func _on_nine_pressed() -> void:
	print("9 pressed")
	key_press(9)

func _on_four_pressed() -> void:
	print("4 pressed")
	key_press(4)


func _on_five_pressed() -> void:
	print("5 pressed")
	key_press(5)

func _on_six_pressed() -> void:
	print("6 pressed")
	key_press(6)

func _on_one_pressed() -> void:
	print("1 pressed")
	key_press(1)

func _on_two_pressed() -> void:
	print("2 pressed")
	key_press(2)

func _on_three_pressed() -> void:
	print("3 pressed")
	key_press(3)
func _on_cross_pressed() -> void:
	print("X pressed")
	answer_label.text = ""

func _on_zero_pressed() -> void:
	print("0 pressed")
	key_press(0)

func _on_tick_pressed() -> void:
	print("C pressed")
	check_answer()
