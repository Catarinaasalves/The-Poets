extends Area2D

var player_near = false

func _on_area_entered(area):
	player_near = true
	print("Perto do quadro")
	print(area.name)

func _on_area_exited(area):
	player_near = false
	print("Saiu do quadro")
	print(area.name)
