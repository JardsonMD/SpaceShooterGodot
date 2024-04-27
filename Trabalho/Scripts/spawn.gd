extends Node2D

var spawn = null
var Enemy = preload("res://Trabalho/cenas/enemy.tscn")


func _ready():
	
	randomize()
	spawn = $Positions.get_children()
	
	pass

func spawn_enemy():
	
	var index = randi() % spawn.size()
	var enemy = Enemy.instance()
	enemy.global_position = spawn[index].global_position
	add_child(enemy)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_spawntimer_timeout():
	spawn_enemy()
