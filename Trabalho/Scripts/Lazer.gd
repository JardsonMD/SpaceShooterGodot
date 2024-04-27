extends Node2D

var vel = 1260
func _ready():
	pass 
func _process(delta):
	
	translate(Vector2(0, -1) * vel * delta)

	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_area_entered(area):
	print(area)
	queue_free()
