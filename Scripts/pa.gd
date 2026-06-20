extends Area2D

var player_near = false

@onready var caeiro_manager = $".."

func _on_input_event(viewport, event, shape_idx):

	if !player_near:
		return

	if event is InputEventMouseButton:

		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:

			visible = false

			caeiro_manager.apanhar_pa()


func _on_area_entered(area):

	player_near = true


func _on_area_exited(area):

	player_near = false


func _on_mouse_entered():

	CursorManager.mostrar_hover()


func _on_mouse_exited():

	CursorManager.mostrar_normal()
