class_name EnemyStateStun extends EnemyState

@export var anim_name: String = "stun"
@export var knockback_speed: float = 200.0
@export var decelerate_speed: float = 10.0

@export_category("AI")
@export var next_state: EnemyState

var _direction: Vector2
var _animation_finished: bool = false

func init():
	enemy.enemy_damaged.connect(_on_enemy_damaged)

func enter():
	enemy.invulnerable = true
	_animation_finished = false
	_direction = enemy.global_position.direction_to(enemy.player.global_position)
	enemy.velocity = _direction * -knockback_speed
	enemy.set_direction(_direction)
	enemy.update_animation(anim_name)
	enemy.animation_player.animation_finished.connect(_on_animation_finished)

func exit():
	enemy.invulnerable = false
	enemy.animation_player.animation_finished.disconnect(_on_animation_finished)

func process(delta: float) -> EnemyState:
	if _animation_finished:
		return next_state
	enemy.velocity -= enemy.velocity * decelerate_speed * delta
	return null

func physics(delta: float) -> EnemyState:
	return null

func _on_enemy_damaged():
	state_machine.change_state(self)

func _on_animation_finished(_a: String):
	_animation_finished = true
