class_name HurtBox extends Area2D

@export var damage: int = 1

func _ready():
	area_entered.connect(hit_entered)

func hit_entered(a: Area2D):
	if a is HitBox:
		a.take_damage(damage)
