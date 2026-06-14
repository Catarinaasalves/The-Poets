extends Area2D

var cooldown = false

@onready var reis_manager = $"../../../World/ReisManager"
@onready var som_metal1 = $"../SomMetal1"
@onready var som_metal2 = $"../SomMetal2"

var proximo_som = 1

func _on_area_entered(area):

	if !reis_manager.operation_open:
		return

	if cooldown:
		return

	if area.name == "PincaArea":

		if proximo_som == 1:
			som_metal1.play()
			proximo_som = 2
		else:
			som_metal2.play()
			proximo_som = 1

		reis_manager.aumentar_ruido(10)

		cooldown = true

		await get_tree().create_timer(0.2).timeout

		cooldown = false
