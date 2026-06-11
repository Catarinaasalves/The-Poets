extends Control

const GAME_SCENE = "res://Game.tscn"

@onready var video = $"../VideoStreamPlayer"

func _ready():
	video.play()

   # Esconde os botões enquanto o vídeo está a correr
	visible = false

func _process(_delta):
	
	if !video.is_playing() and !visible:
		visible = true
