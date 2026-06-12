extends CanvasLayer

var popup_open = false

@onready var inventario = $Inventario

func _process(_delta):

	if popup_open:
		return

	if Input.is_action_just_pressed("ui_inventory"):
		inventario.visible = !inventario.visible
