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

func maquina_ativada():

	maquinas_ativadas += 1

	print("Máquinas ativadas: ", maquinas_ativadas)

	if maquinas_ativadas < velocidades.size():
		campos.speed = velocidades[maquinas_ativadas]

	if maquinas_ativadas >= 6:

		campos.speed = 1200.0

		await get_tree().create_timer(3.0).timeout

		explosion_flash.visible = true

		await get_tree().create_timer(0.2).timeout

		get_tree().change_scene_to_file("res://Reis.tscn")
