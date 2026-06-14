extends Node

var pulseira_apanhada = false
var dicas_lidas = 0

@onready var fade = $"../../UI/Fade"

func _ready():
	pass


func pulseira_recolhida():

	pulseira_apanhada = true
	verificar_fim()


func dica_lida():

	dicas_lidas += 1
	verificar_fim()


func verificar_fim():

	if pulseira_apanhada and dicas_lidas >= 4:

		GameManager.concluir_heteronimo("Pessoa")

		fade.mudar_cena("res://Caeiro.tscn")


func _on_music_player_finished():

	if GameManager.pessoa_concluido:
		return

	var proximo = GameManager.obter_proximo_aleatorio()

	if proximo == "Fim":
		return

	fade.mudar_cena(
		GameManager.obter_cena(proximo)
	)
