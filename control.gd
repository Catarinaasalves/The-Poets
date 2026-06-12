extends Control

const GAME_SCENE = "res://Pessoa.tscn"

@onready var video = $"../VideoStreamPlayer"

func _ready():
	video.play()

	visible = false

func _process(_delta):
	
	if !video.is_playing() and !visible:
		visible = true
