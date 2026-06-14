extends Node

var ruido = 0
var operation_open = false

@onready var barra_ruido = $"../../UI/OperationGame/BarraRuido"
@onready var vinheta = $"../../UI/OperationGame/Vinheta"
@onready var fade = $"../../UI/Fade"

func _ready():
	pass


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

		GameManager.concluir_heteronimo("Reis")

		await get_tree().create_timer(2.0).timeout

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
