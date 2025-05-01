class_name StateAttack extends State

var is_attacking: bool = false

@export var attack_sound: AudioStream
@export_range(1, 20, 0.5) var decelerate_speed: float = 5.0

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var attack_anim_player: AnimationPlayer = $"../../Sprite2D/AttackEffectSprite/AnimationPlayer"
@onready var audio: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

@onready var idle: State = $"../Idle"
@onready var walk: State = $"../Walk"

func enter():
	player.update_animation("attack")
	attack_anim_player.play("attack_" + player.anim_direction())
	animation_player.animation_finished.connect(end_attack)
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.9, 1.1)
	audio.play()
	is_attacking = true

func exit():
	animation_player.animation_finished.disconnect(end_attack)
	is_attacking = false

## What happens during the _process update in this State
func process(delta: float) -> State:
	player.velocity -= player.velocity * decelerate_speed * delta
	
	if not is_attacking:
		if player.direction == Vector2.ZERO:
			return idle
	return null

## What happens during the _physics_process update in this State
func physics(delta: float) -> State:
	return null

## What happens with input events in this State
func handle_input(event: InputEvent) -> State:
	return null

func end_attack(_new_anim_name: String):
	is_attacking = false
