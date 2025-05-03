class_name EnemyStateMachine extends Node

var states: Array[EnemyState]
var prev_state: EnemyState
var cur_state: EnemyState

func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED

func _process(delta: float):
	change_state(cur_state.process(delta))

func _physics_process(delta: float):
	change_state(cur_state.physics(delta))

func initialize(enemy: Enemy):
	states = []
	for c in get_children():
		if c is EnemyState:
			states.append(c)
	
	for s in states:
		s.enemy = enemy
		s.state_machine = self
		s.init()
	
	if states.size() > 0:
		change_state(states[0])
		process_mode = Node.PROCESS_MODE_INHERIT

func change_state(new_state: EnemyState):
	if new_state == null || new_state == cur_state:
		return
	
	if cur_state:
		cur_state.exit()
	
	prev_state = cur_state
	cur_state = new_state
	cur_state.enter()
