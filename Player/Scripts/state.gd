class_name State extends Node

## Stores a reference to the player that this State belongs to
static var player: Player

func enter():
	pass

func exit():
	pass

## What happens during the _process update in this State
func process(delta: float) -> State:
	return null

## What happens during the _physics_process update in this State
func physics(delta: float) -> State:
	return null

## What happens with input events in this State
func handle_input(event: InputEvent) -> State:
	return null
