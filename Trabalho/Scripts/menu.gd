extends Node2D

var opcao = 0
var blinks = 0

func _ready():
	pass 
	
func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		opcao += 1
	elif Input.is_action_just_pressed("ui_up"):
		opcao -= 1
	
	if opcao < 0:
		opcao = $itens.get_child_count() -1
	elif opcao > $itens.get_child_count() -1:
		opcao = 0
		
	if Input.is_action_just_pressed("ui_accept"):
		match opcao:
			0:
				$blinks.start()
			1:
				$blinks.start()
			2:
				get_tree().quit()
		
	$seta.global_position = $itens.get_child(opcao).global_position + Vector2(-25, 35)
	pass
	
	


func _on_blinks_timeout():
	blinks += 1
	if opcao == 0:
		$itens/start.visible = not $itens/start.visible
		if blinks > 8:
			get_tree().change_scene("res://Trabalho/cenas/Mundo.tscn")
	if opcao == 1:
		$itens/options.visible = not $itens/options.visible
		if blinks > 8:
			get_tree().change_scene("res://Trabalho/cenas/controles.tscn")
	
