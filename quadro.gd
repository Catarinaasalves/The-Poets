extends Area2D

var player_near = false
var collected = false
var showing_popup = false

@onready var popup_background = $"../../../UI/PopupBackground"
@onready var pulseira_popup = $"../../../UI/PulseiraPopup"

@onready var pulseira_hotbar = $"../../../UI/Hotbar/PulseiraHotbar"
@onready var pulseira_inventario = $"../../../UI/Inventario/PulseiraInventario"

@onready var pessoa_manager = get_parent()

func _on_input_event(viewport, event, shape_idx):

	if !player_near:
		return

	if collected:
		return

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:

			showing_popup = true

			popup_background.visible = true
			pulseira_popup.visible = true

			await get_tree().create_timer(2.0).timeout

			popup_background.visible = false
			pulseira_popup.visible = false

			pulseira_hotbar.visible = true
			pulseira_inventario.visible = true

			collected = true
			showing_popup = false

			pessoa_manager.pulseira_recolhida()


func _on_area_entered(area):
	player_near = true


func _on_area_exited(area):
	player_near = false
