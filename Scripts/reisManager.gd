extends Node

var ruido = 0
var operation_open = false

@onready var barra_ruido = $"../../UI/OperationGame/BarraRuido"
@onready var vinheta = $"../../UI/OperationGame/Vinheta"
@onready var fade = $"../../UI/Fade"

@onready var operation_game = $"../../UI/OperationGame"
@onready var popup_background = $"../../UI/PopupBackground"

@onready var cadaver_hotbar = $"../../UI/Hotbar/CadaverHotbar"
@onready var cadaver_inventario = $"../../UI/Inventario/CadaverInventario"

func _ready():

	cadaver_hotbar.visible = false
	cadaver_inventario.visible = false


func _process(delta):

	if ruido > 0:

		ruido -= 10 * delta

		if ruido < 0:
			ruido = 0

	barra_ruido.value = ruido

	var alpha = ruido / 100.0
	vinheta.modulate.a = alpha


func aumentar_ruido(valor):

	ruido += valor

	if ruido > 100:
		ruido = 100

	barra_ruido.value = ruido

	print("Ruído atual: ", ruido)

	if ruido >= 100:

		cadaver_hotbar.visible = true
		cadaver_inventario.visible = true

		operation_game.visible = false
		popup_background.visible = false

		GameManager.concluir_heteronimo("Reis")

		await get_tree().create_timer(3.0).timeout

		if GameManager.todos_concluidos():

			fade.mudar_cena("res://Fim.tscn")

		else:

			fade.mudar_cena("res://Pessoa.tscn")


func _on_music_player_finished():

	if GameManager.reis_concluido:
		return

	var proximo = GameManager.obter_proximo_aleatorio()

	if proximo == "Fim":
		return

	fade.mudar_cena(
		GameManager.obter_cena(proximo)
	)


func _on_texture_button_pressed():
	get_node("/root/Node2D/Hint/HintPopup").show_hint(
		"Há limites que existem para ser respeitados por homens prudentes.\n\nEu nunca fui um deles."
	)
