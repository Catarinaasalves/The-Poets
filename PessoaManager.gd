extends Node

var pulseira_apanhada = false
var dicas_lidas = 0

func pulseira_recolhida():

	pulseira_apanhada = true
	verificar_fim()


func dica_lida():

	dicas_lidas += 1
	verificar_fim()


func verificar_fim():

	if pulseira_apanhada and dicas_lidas >= 4:

		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://Caeiro.tscn")
