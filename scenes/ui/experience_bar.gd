extends CanvasLayer

@export var experience_manager: Node
@onready var progress_bar = %ProgressExperience


func _ready() -> void:
	progress_bar.value = 0
	experience_manager.experience_updated.connect(on_experience_updated)
	

func on_experience_updated(current_experience: float, target_experience: float):
	assert(target_experience > 0, "target_experience < 0")
	
	var percent = current_experience / target_experience
	progress_bar.value = percent
