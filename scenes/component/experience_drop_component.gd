extends Node

@export_range(0, 1) var drop_percent: float = .5
@export var experience_scene: PackedScene
@export var health_component: Node

func _ready() -> void:
	(health_component as HealthComponent).died.connect(on_died)
	

func on_died():
	if randf() > drop_percent: return
	#assert(randf() <= drop_percent, "DropPercentError")	
	assert(experience_scene != null, "Vial null")
	assert(owner is Node2D, "Owner is not a Node2D")
	
	var spawn_position = (owner as Node2D).global_position
	var experience_instance = experience_scene.instantiate() as Node2D
	var entities_layer = get_tree().get_first_node_in_group('entities_layer')
	entities_layer.add_child(experience_instance)
	experience_instance.global_position = spawn_position
