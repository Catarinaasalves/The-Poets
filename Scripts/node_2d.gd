extends Node2D

@onready var menu = $Control

func _ready():
	$Control/start.pressed.connect(_on_start_pressed)
	$Control/options.pressed.connect(_on_options_pressed)

func _on_start_pressed():
	get_tree().change_scene_to_file("res://loadingnode_2d.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://options.tscn")
