extends CharacterBody2D

# Prędkość poruszania się postaci
var speed = 200

# Odwołanie do AnimationPlayer
@onready var animation_player = get_node("AnimatedSprite2D")  # Upewnij się, że ścieżka jest poprawna

func _ready():
	pass

func _process(delta):
	var input_velocity = Vector2()  # Wektor do przechowywania ruchu na podstawie wejścia

	# Sprawdzanie, czy przyciski WSAD są wciśnięte
	if Input.is_action_pressed("prawo"):
		input_velocity.x += 1
	if Input.is_action_pressed("lewo"):
		input_velocity.x -= 1

	if Input.is_action_pressed("dol"):
		input_velocity.y += 1
	if Input.is_action_pressed("gora"):
		input_velocity.y -= 1

	# Normalizowanie wektora ruchu, aby poruszać się z równą prędkością we wszystkich kierunkach
	input_velocity = input_velocity.normalized() * speed

	# Przypisanie prędkości do wbudowanej zmiennej velocity
	velocity = input_velocity

	# Przemieszczanie postaci
	move_and_slide()

	# Sprawdzanie, czy postać się porusza
	if velocity.length() > 0:
		# Sprawdzamy kierunek ruchu i uruchamiamy odpowiednią animację
		if input_velocity.x > 0:
			animation_player.play("ruchPrawo")  # Animacja w prawo
		elif input_velocity.x < 0:
			animation_player.play("ruchPrawo")  # Animacja w lewo

		# Dodatkowo, możemy dodać animację dla ruchu w górę/dół, jeśli chcesz
		if input_velocity.y > 0:
			animation_player.play("ruchPrawo")  # Animacja w dół (jeśli masz)
		elif input_velocity.y < 0:
			animation_player.play("ruchPrawo")  # Animacja w górę (jeśli masz)
	else:
		# Jeśli postać stoi w miejscu, gra animację "stanie"
		animation_player.play("stanie")
