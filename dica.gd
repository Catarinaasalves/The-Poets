extends Area2D

@export var imagem_dica: Texture2D

var player_near = false
var popup_open = false
var ja_lida = false

@onready var popup_background = $"../../../UI/PopupBackground"
@onready var dica_popup = $"../../../UI/DicaPopup"

@onready var pessoa_manager = get_parent()

func _process(_delta):

	if popup_open:

		if Input.is_action_just_pressed("interact"):

			popup_background.visible = false
			dica_popup.visible = false
			popup_open = false


func _on_input_event(viewport, event, shape_idx):

	if !player_near:
		return

	if popup_open:
		return

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:

			dica_popup.texture = imagem_dica
			popup_background.visible = true
			dica_popup.visible = true

			popup_open = true

			if !ja_lida:
				ja_lida = true
				pessoa_manager.dica_lida()


func _on_area_entered(area):
	player_near = true


func _on_area_exited(area):
	player_near = false
