extends Node

var pessoa_concluido = false
var caeiro_concluido = false
var campos_concluido = false
var reis_concluido = false

var ultimo_heteronimo = ""

func concluir_heteronimo(nome):

	match nome:

		"Pessoa":
			pessoa_concluido = true

		"Caeiro":
			caeiro_concluido = true

		"Campos":
			campos_concluido = true

		"Reis":
			reis_concluido = true

	ultimo_heteronimo = nome


func todos_concluidos():

	return (
		pessoa_concluido
		and caeiro_concluido
		and campos_concluido
		and reis_concluido
	)


func obter_cena(nome):

	match nome:

		"Pessoa":
			return "res://Pessoa.tscn"

		"Caeiro":
			return "res://Caeiro.tscn"

		"Campos":
			return "res://Campos.tscn"

		"Reis":
			return "res://Reis.tscn"

	return ""


func obter_proximo_aleatorio():

	var disponiveis = []

	if !pessoa_concluido:
		disponiveis.append("Pessoa")

	if !caeiro_concluido:
		disponiveis.append("Caeiro")

	if !campos_concluido:
		disponiveis.append("Campos")

	if !reis_concluido:
		disponiveis.append("Reis")

	if disponiveis.is_empty():
		return "Fim"

	if disponiveis.size() == 1:
		return disponiveis[0]

	if disponiveis.has(ultimo_heteronimo):
		disponiveis.erase(ultimo_heteronimo)

	return disponiveis[randi() % disponiveis.size()]
