extends Sprite

var des = 0
export(NodePath) var nave 

func _ready():
	if nave:
		nave = get_node(nave)
	else:
		set_process(false)
	
	pass 
	
func _process(delta):
	
	des += delta
	material.set_shader_param("des", (nave.global_position.x - 80) * .001) 
	
	pass
