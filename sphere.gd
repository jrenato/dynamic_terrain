extends RigidBody2D


func _physics_process(delta: float) -> void:
	var input_axis : float = Input.get_axis("ui_left", "ui_right")
	var force : Vector2 = Vector2(1, 0) * input_axis * 10
	apply_impulse(force)
