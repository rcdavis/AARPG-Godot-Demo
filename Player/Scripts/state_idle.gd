class_name StateIdle extends State

@onready var walk: State = $"../Walk"

func enter():
	player.update_animation("idle")

func exit():
	pass

## What happens during the _process update in this State
func process(delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	
	player.velocity = Vector2.ZERO
	return null

## What happens during the _physics_process update in this State
func physics(delta: float) -> State:
	return null

## What happens with input events in this State
func handle_input(event: InputEvent) -> State:
	return null
