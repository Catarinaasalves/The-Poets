extends Area2D

var player_near = false
var ativada = false

@onready var campos_manager = get_parent()

func _on_input_event(viewport, event, shape_idx):

	if !player_near:
		return

	if ativada:
		return

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:

			ativada = true

			campos_manager.maquina_ativada()


func _on_area_entered(area):
	player_near = true


func _on_area_exited(area):
	player_near = false
