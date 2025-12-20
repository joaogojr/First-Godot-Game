extends Area2D
class_name HurtboxComponent

@export var health_component: Node

func _ready() -> void:
	area_entered.connect(on_area_entered)
	
	
func on_area_entered(other_area: Area2D):
	assert(other_area is HitboxComponent, 'Other area type error')
	assert(health_component != null, 'Health component is null')
	
	var hitbox_component = other_area as HitboxComponent
	health_component.damage(hitbox_component.damage)
