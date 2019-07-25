extends Node2D
const SPEED = 500

func _ready():
	set_as_toplevel(true)
	global_position = get_parent().global_position

func _process(delta):
	position.y += SPEED * delta
	manage_collision()


func manage_collision():
	var collider = $Area2D.get_overlapping_bodies()
	for object in collider:
		if object.name == "Player":
			get_tree().call_group("GameState", "hurt")
		queue_free()

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
