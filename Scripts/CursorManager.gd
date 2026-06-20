extends Node

var cursor_normal = preload("res://assets jogo/UI/cursor_normal.png")
var cursor_hover = preload("res://assets jogo/UI/cursor_click.png")

func _ready():

	print("CURSOR MANAGER CARREGADO")

	Input.set_custom_mouse_cursor(cursor_normal)

	print("CURSOR NORMAL APLICADO")


func mostrar_hover():

	print("HOVER")

	Input.set_custom_mouse_cursor(cursor_hover)


func mostrar_normal():

	print("NORMAL")

	Input.set_custom_mouse_cursor(cursor_normal)
