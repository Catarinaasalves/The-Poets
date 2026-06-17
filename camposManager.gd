extends Node

var maquinas_ativadas = 0

var velocidades = [
	200.0,
	250.0,
	320.0,
	450.0,
	600.0,
	800.0,
	1200.0
]

@onready var campos = get_node("Campos")
@onready var explosion_flash = $"../../UI/ExplosionFlash"
@onready var fade = $"../../UI/Fade"

func _ready():
	pass


func maquina_ativada():

	maquinas_ativadas += 1

	print("Máquinas ativadas: ", maquinas_ativadas)

	if maquinas_ativadas < velocidades.size():
		campos.speed = velocidades[maquinas_ativadas]

	if maquinas_ativadas >= 6:

		GameManager.concluir_heteronimo("Campos")

		campos.speed = 1200.0

		await get_tree().create_timer(3.0).timeout

		explosion_flash.visible = true

		await get_tree().create_timer(0.2).timeout

		if GameManager.todos_concluidos():

			fade.mudar_cena("res://Fim.tscn")

		else:

			fade.mudar_cena("res://Reis.tscn")


func _on_music_player_finished():

	if GameManager.campos_concluido:
		return

	var proximo = GameManager.obter_proximo_aleatorio()

	if proximo == "Fim":
		return

	fade.mudar_cena(
		GameManager.obter_cena(proximo)
	)
