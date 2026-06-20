extends Node2D

const GAME_SCENE = "res://Pessoa.tscn"
var _load_progress = []

@onready var video = $Control/VideoStreamPlayer

func _ready():
	video.play()
	ResourceLoader.load_threaded_request(GAME_SCENE)

func _process(_delta):
	var status = ResourceLoader.load_threaded_get_status(GAME_SCENE, _load_progress)

	if status == ResourceLoader.THREAD_LOAD_LOADED:
		var scene = ResourceLoader.load_threaded_get(GAME_SCENE)
		get_tree().change_scene_to_packed(scene)
