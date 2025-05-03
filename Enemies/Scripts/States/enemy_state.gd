class_name EnemyState extends Node

## Stores a reference to the enemy that this state belongs to
var enemy: Enemy
var state_machine: EnemyStateMachine

func init():
	pass

func enter():
	pass

func exit():
	pass

func process(delta: float) -> EnemyState:
	return null

func physics(delta: float) -> EnemyState:
	return null
