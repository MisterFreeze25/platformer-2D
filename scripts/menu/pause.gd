extends Node

@onready var pause_panel = $PausePanel

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = false
	pause_panel.hide()

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			get_tree().paused = false
			pause_panel.hide()
		else:
			get_tree().paused = true
			pause_panel.show()

func _on_resume_pressed() -> void:
	pause_panel.hide()
	get_tree().paused = false

func _on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu/main_menu.tscn")
