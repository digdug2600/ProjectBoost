extends RigidBody3D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Boost"):
		apply_central_force(basis.y * delta * 1000.0)

	if Input.is_action_pressed("Left Rotate"):
		apply_torque(Vector3(0.0, 0.0, 100.0 * delta))

	if Input.is_action_pressed("Rotate Right"):
		apply_torque(Vector3(0.0, 0.0, -100.0 * delta))
