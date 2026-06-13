extends Node2D

@export var speed = 200.0

@onready var animation = $CamposPersonagem/PessoaAnima

func _process(delta):

	var direction = Vector2.ZERO

	if Input.is_key_pressed(KEY_A):
		direction.x -= 1

	if Input.is_key_pressed(KEY_D):
		direction.x += 1

	if Input.is_key_pressed(KEY_W):
		direction.y -= 1

	if Input.is_key_pressed(KEY_S):
		direction.y += 1

	if direction != Vector2.ZERO:

		direction = direction.normalized()
		position += direction * speed * delta

		position.x = clamp(position.x, -300, 450)
		position.y = clamp(position.y, -15, 100)

		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				if animation.current_animation != "Direita":
					animation.play("Direita")
			else:
				if animation.current_animation != "Esquerda":
					animation.play("Esquerda")
		else:
			if direction.y > 0:
				if animation.current_animation != "Frente":
					animation.play("Frente")
			else:
				if animation.current_animation != "Trás":
					animation.play("Trás")

	else:
		animation.stop()
		animation.seek(0.0, true)


func _on_interaction_area_area_entered(area):
	print("Entrou em alguma coisa")
	print(area.name)
