class_name PlayerStateMachine extends Node

var states: Array[State]
var prev_state: State
var cur_State: State

func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED

func _process(delta: float):
	change_state(cur_State.process(delta))

func _physics_process(delta: float):
	change_state(cur_State.physics(delta))

func _unhandled_input(event: InputEvent):
	change_state(cur_State.handle_input(event))

func initialize(player: Player):
	states = []
	
	for c in get_children():
		if c is State:
			states.append(c)
	
	if states.size() > 0:
		states[0].player = player
		change_state(states[0])
		process_mode = Node.PROCESS_MODE_INHERIT

func change_state(new_state: State):
	if new_state == null || new_state == cur_State:
		return
	
	if cur_State:
		cur_State.exit()
	
	prev_state = cur_State
	cur_State = new_state
	cur_State.enter()
