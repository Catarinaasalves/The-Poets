extends Node2D

@onready var fade = $"../../UI/Fade"

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func concluir_nivel():

	GameManager.concluir_heteronimo("Caeiro")

	fade.mudar_cena("res://Campos.tscn")


func _on_music_player_finished():

	if GameManager.caeiro_concluido:
		return

	var proximo = GameManager.obter_proximo_aleatorio()

	if proximo == "Fim":
		return

	fade.mudar_cena(
		GameManager.obter_cena(proximo)
	)
