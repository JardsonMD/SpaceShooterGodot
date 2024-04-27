extends CanvasLayer

var score = 0

func _ready():
	pass 


func _process(delta):
	if get_node("../Nave").cont == 0:
		$shield.visible = true
	elif get_node("../Nave").cont == 1:
		$shield.visible = false
	pass

func enemy_down(pts):
	var pontos = pts * 100
	score += pontos
	$score.text = str(score)
	pass
	
func nave_damage(hp):
	var vida = hp
	$hp.text = str(vida)
	pass
