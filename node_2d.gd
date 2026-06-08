extends Node2D

@onready var video = $VideoStreamPlayer
@onready var menu = $Control

func _ready():
	video.play()
	$Control/start.pressed.connect(_on_start_pressed)
	$Control/options.pressed.connect(_on_options_pressed)

func _process(_delta):
	if not video.is_playing() and not menu.visible:
		menu.visible = true

func _on_start_pressed():
	get_tree().change_scene_to_file("res://loadingnode_2d.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Options.tscn")
