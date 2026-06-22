extends Node2D

var pa_apanhada = false
var pa_usada = false

var lapide_nascimento_resolvida = false
var lapide_morte_resolvida = false

var lapide_atual = ""

@onready var background = $"../../Background"
@onready var pa_animada = $PaAnimada

@onready var pa_hotbar = $"../../UI/Hotbar/PaHotbar"
@onready var pa_inventario = $"../../UI/Inventario/PaInventario"

@onready var popup_background = $"../../UI/PopupBackground"
@onready var popup_lapide = $"../../UI/PopupLapide"
@onready var texto = $"../../UI/PopupLapide/Texto"
@onready var input_ano = $"../../UI/PopupLapide/InputAno"

@onready var buraco = $Buraco
@onready var buraco_colisao = $BuracoColisao

func _ready():

	pa_animada.visible = false

	pa_hotbar.visible = false
	pa_inventario.visible = false

	popup_background.visible = false
	popup_lapide.visible = false

	buraco.monitoring = false
	buraco_colisao.process_mode = Node.PROCESS_MODE_DISABLED


func apanhar_pa():

	if pa_apanhada:
		return

	pa_apanhada = true

	background.texture = preload("res://Assets/Quartos/CaeiroQuartoSemPa.png")

	pa_hotbar.visible = true
	pa_inventario.visible = true

	print("Pá apanhada")


func usar_pa():

	if !pa_apanhada:
		return

	if pa_usada:
		return

	pa_usada = true

	pa_hotbar.visible = false
	pa_inventario.visible = false

	await animar_pa()


func animar_pa():

	pa_animada.visible = true

	for i in 3:

		pa_animada.rotation_degrees = -20
		await get_tree().create_timer(0.15).timeout

		pa_animada.rotation_degrees = 20
		await get_tree().create_timer(0.15).timeout

	pa_animada.rotation_degrees = 0
	pa_animada.visible = false

	background.texture = preload("res://Assets/Quartos/CaeiroQuartoBuraco.png")

	buraco_colisao.process_mode = Node.PROCESS_MODE_INHERIT

	print("Buraco criado")


func abrir_lapide(tipo):

	lapide_atual = tipo

	popup_background.visible = true
	popup_lapide.visible = true

	input_ano.text = ""
	input_ano.grab_focus()


func validar_lapide():

	var resposta = input_ano.text.strip_edges()

	if lapide_atual == "nascimento":

		if resposta == "1889":

			lapide_nascimento_resolvida = true

			$AreaLapideNascimento.monitoring = false
			$AreaLapideNascimento.visible = false

			fechar_popup()

	if lapide_atual == "morte":

		if resposta == "1915":

			lapide_morte_resolvida = true

			$AreaLapideMorte.monitoring = false
			$AreaLapideMorte.visible = false

			fechar_popup()

	verificar_lapides()


func fechar_popup():

	popup_background.visible = false
	popup_lapide.visible = false


func verificar_lapides():

	if lapide_nascimento_resolvida and lapide_morte_resolvida:

		print("Todas as lápides resolvidas")

		buraco.monitoring = true


func _on_input_ano_text_submitted(new_text):

	validar_lapide()

func saltar_para_buraco():

	var personagem = $Caeiro

	personagem.visible = false

	await get_tree().create_timer(0.5).timeout

	GameManager.concluir_heteronimo("Caeiro")

	var fade = get_tree().get_first_node_in_group("fade")

	if fade != null:

		if GameManager.todos_concluidos():

			fade.mudar_cena("res://Fim.tscn")

		else:

			fade.mudar_cena("res://Campos.tscn")


func _on_texture_button_pressed():
	get_node("/root/Node2D/Hint/HintPopup").show_hint("Aquilo que a terra esconde pode voltar à superfície.\n\nQuanto às lápides, dizem tudo o que têm para dizer a quem as observa.")
