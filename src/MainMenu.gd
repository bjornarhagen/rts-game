extends MarginContainer

onready var selector_new_game = $CenterContainer/VBoxContainer/Options/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selector_settings = $CenterContainer/VBoxContainer/Options/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var selector_exit = $CenterContainer/VBoxContainer/Options/VBoxContainer/CenterContainer3/HBoxContainer/Selector

var current_selection = 0
var number_of_sections = 3

func _ready():
	set_current_selection(0)

func empty_selection():
	selector_new_game.text = ""
	selector_settings.text = ""
	selector_exit.text = ""

# TODO: Fix direction changing bug
func set_current_selection(direction):
	empty_selection()
	current_selection+=direction
	var processed_selection = abs(current_selection) % number_of_sections	
	if processed_selection == 0:
		selector_new_game.text = ">"
	if processed_selection == 1:
		selector_settings.text = ">"
	if processed_selection == 2:
		selector_exit.text = ">"

func handle_selection(_current_selection):	
	if _current_selection == 0:
		var main_scene = preload("res://src/Main.tscn").instance()
		get_tree().get_root().add_child(main_scene)
		queue_free()
	if _current_selection == 1:
		print("TODO: Add options")
	if _current_selection == 2:
		get_tree().quit()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up") or event.is_action_pressed("camera_forward"):
		set_current_selection(1)
	if event.is_action_pressed("ui_down") or event.is_action_pressed("camera_backward"):
		set_current_selection(-1)
	if event.is_action_pressed("ui_accept"):
		handle_selection(current_selection)
