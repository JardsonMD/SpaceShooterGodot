extends Node2D

export(NodePath) var nave


# Called when the node enters the scene tree for the first time.
func _ready():
	if nave:
		nave = get_node(nave)
	else:
		set_process(false)
	pass 

func _process(delta):
	
	global_position.x = (nave.global_position.x -80) * 0.001 * -60
	
