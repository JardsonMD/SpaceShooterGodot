extends Node2D

const PRE_LAZER = preload("res://Trabalho/cenas/Lazer.tscn")

var vel = 120
var mouse 
var hp = 5
var time = 0
var blinks = 0
var cont = 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	pass 

func _process(delta):
	
	var dirY = 0
	var dirX = 0
	
	if Input.is_action_pressed("ui_left"):
		dirX += -1
	if Input.is_action_pressed("ui_right"):
		dirX += 1	
	if Input.is_action_pressed("ui_up"):
		dirY += -1
	if Input.is_action_pressed("ui_down"):
		dirY += 1	
	translate(Vector2(dirX,dirY) * vel * delta)
	
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("shoot"):
		if get_tree().get_nodes_in_group("Lazeres").size() < 6:
			var lazer1 = PRE_LAZER.instance()
			var lazer2 = PRE_LAZER.instance()
			get_parent().add_child(lazer1)
			lazer1.global_position = $Blaster1.global_position
			get_parent().add_child(lazer2)
			lazer2.global_position = $Blaster2.global_position
	
	mouse = get_global_mouse_position()
	global_position = mouse
	global_position.x = clamp(global_position.x, 35, 505)
	global_position.y = clamp(global_position.y, 27, 933)
	
	if hp <= 0:
		get_tree().call_group("camera", "treme", 20)
		get_tree().change_scene("res://Trabalho/cenas/menu.tscn")
		
	if Input.is_action_just_pressed("iframe") and cont == 0:
		time = 1
		cont = 1
		$Delay.start()
		$iframe.start()
		
	pass
func _on_Delay_timeout():
	cont = 0
pass
	
func bater():
	pass

func _on_Nave_area_entered(area):
	if time == 0:
		hp -= 1
		get_tree().call_group("hud", "nave_damage", hp)
		get_tree().call_group("camera", "treme", 5)
	pass
func _on_iframe_timeout():
	blinks += 1
	$sprite.visible = not $sprite.visible
	if blinks > 6:
		$sprite.visible = true
		time = 0
		blinks = 0
		$iframe.stop()
	pass 



