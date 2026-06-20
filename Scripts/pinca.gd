extends Area2D

var tremor = 0.0

@onready var reis_manager = $"../../../World/ReisManager"

func _process(_delta):

	var posicao_rato = get_global_mouse_position()

	if reis_manager.ruido >= 80:
		tremor = 8.0
	elif reis_manager.ruido >= 50:
		tremor = 3.0
	else:
		tremor = 0.0

	global_position = posicao_rato + Vector2(
		randf_range(-tremor, tremor),
		randf_range(-tremor, tremor)
	)
