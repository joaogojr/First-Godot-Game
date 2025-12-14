extends Node

var current_experience = 0



func _ready() -> void:
	GameEvents.experience_collected.connect(on_experience_collected)


func on_experience_collected(number: float):
	increment_experience(number)
	
	
func increment_experience(number: float):
	current_experience += number
	print(current_experience)
	
