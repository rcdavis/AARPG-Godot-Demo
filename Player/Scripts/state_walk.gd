class_name StateWalk extends State

@export var move_speed: float = 200.0

@onready var idle: State = $"../Idle"
@onready var attack: State = $"../Attack"

func enter():
	player.update_animation("walk")

func exit():
	pass

## What happens during the _process update in this State
func process(delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.set_direction():
		player.update_animation("walk")
	
	return null

## What happens during the _physics_process update in this State
func physics(delta: float) -> State:
	return null

## What happens with input events in this State
func handle_input(event: InputEvent) -> State:
	if event.is_action_pressed("attack"):
		return attack
	
	return null
