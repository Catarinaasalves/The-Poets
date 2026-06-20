extends ColorRect

var velocidade = 2.0
var a_fazer_fade_out = false
var proxima_cena = ""

func _ready():

	modulate.a = 1.0


func _process(delta):

	if modulate.a > 0 and !a_fazer_fade_out:

		modulate.a -= velocidade * delta

		if modulate.a < 0:
			modulate.a = 0

	if a_fazer_fade_out:

		modulate.a += velocidade * delta

		if modulate.a >= 1:

			modulate.a = 1
			a_fazer_fade_out = false

			get_tree().change_scene_to_file(proxima_cena)


func mudar_cena(cena):

	proxima_cena = cena
	a_fazer_fade_out = true
