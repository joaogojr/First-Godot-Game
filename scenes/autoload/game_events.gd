extends Node

signal experience_collected(number: float)



func emit_experience_collected(number: float):
	experience_collected.emit(number)
