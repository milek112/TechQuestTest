extends 

@export var player: CharacterBody2D  # Referencja do gracza

func _process(_delta):
	if player.position.y > position.y:
		z_index = 2  # Drzewo jest niżej, więc jest na wierzchu
	else:
		z_index = 0  # Gracz jest za drzewem
