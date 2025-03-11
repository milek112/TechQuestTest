extends Area2D

@onready var transition_effect: Sprite2D = $TransitionEffect if has_node("TransitionEffect") else null

func _ready():
	connect("body_entered", _on_body_entered)  # Upewnij się, że sygnał jest podłączony
	print("Skrypt załadowany, wejście do jaskini gotowe!")

func _on_body_entered(body):
	print("Wykryto wejście: ", body.name)  # Debugowanie

	if body.name == "gracz":
		print("Gracz wszedł do wejścia!")  # Sprawdzenie, czy działa
		if transition_effect:
			transition_effect.visible = true  # Jeśli efekt istnieje, aktywuj go
		
		await get_tree().create_timer(0.1).timeout  # Czekaj 1 sekundę
		var result = get_tree().change_scene_to_file("res://jaskinia.tscn")

		if result != OK:
			print("Błąd zmiany sceny! Kod błędu: ", result)
