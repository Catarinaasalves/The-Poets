extends Control

@onready var hint_label = $HintUI/Label

func show_hint(text:String):
	hint_label.text = text
	visible = true

func _on_background_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		visible = false
