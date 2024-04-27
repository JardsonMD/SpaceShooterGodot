extends Node2D

const PRE_LAZERE = preload("res://Trabalho/cenas/LazerE.tscn")
var vel = 120
var hp = 4

func _ready():
	pass 
	
func _process(delta):
	
	translate(Vector2(0,1) * vel * delta)
	
	if hp <= 0:
		var pts = 1
		queue_free()
		get_tree().call_group("hud", "enemy_down", pts)
	
	pass
func _on_lazertimer_timeout():
	
	var lazer = PRE_LAZERE.instance()
	get_parent().add_child(lazer)
	lazer.global_position = $Blaster.global_position
	
	pass 
	
func _on_Area2D_area_entered(area):
	hp -=1
	if area.has_method("bater"):
		var pts = 1
		queue_free()
		get_tree().call_group("hud", "enemy_down", pts)
	pass # Replace with function body.
