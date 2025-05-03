class_name EnemyStateDestroy extends EnemyState

@export var anim_name: String = "destroy"
@export var knockback_speed: float = 200.0
@export var decelerate_speed: float = 10.0

var _direction: Vector2

func init():
	enemy.enemy_destroyed.connect(_on_enemy_destroyed)

func enter():
	enemy.invulnerable = true
	
	_direction = enemy.global_position.direction_to(enemy.player.global_position)
	enemy.velocity = _direction * -knockback_speed
	enemy.set_direction(_direction)
	
	enemy.update_animation(anim_name)
	enemy.animation_player.animation_finished.connect(_on_animation_finished)

func exit():
	pass

func process(delta: float) -> EnemyState:
	enemy.velocity -= enemy.velocity * decelerate_speed * delta
	return null

func physics(delta: float) -> EnemyState:
	return null

func _on_enemy_destroyed():
	state_machine.change_state(self)

func _on_animation_finished(_a: String):
	enemy.queue_free()
