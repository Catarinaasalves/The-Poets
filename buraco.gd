extends Area2D

var player_near = false

func _input_event(viewport, event, shape_idx):

	if !player_near:
		return

	if !monitoring:
		return

	if event is InputEventMouseButton:

		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:

			var manager = get_tree().get_first_node_in_group("caeiroManager")

			if manager != null:

				await manager.saltar_para_buraco()


func _on_area_entered(area):

	player_near = true


func _on_area_exited(area):

	player_near = false


func _on_mouse_entered():
	CursorManager.mostrar_hover()

func _on_mouse_exited():
	CursorManager.mostrar_normal()
