extends TextureRect

func _gui_input(event):

	if event is InputEventMouseButton:

		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:

			var caeiro_manager = get_tree().get_first_node_in_group("caeiroManager")

			if caeiro_manager != null:
				caeiro_manager.usar_pa()
