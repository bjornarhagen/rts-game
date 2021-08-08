extends Node

########################
# EXPORT PARAMS
########################

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		var main_menu_scene = preload("res://src/MainMenu.tscn").instance()
		get_tree().get_root().add_child(main_menu_scene)
		queue_free()
