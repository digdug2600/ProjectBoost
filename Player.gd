extends RigidBody3D
## How much vertical force to apply when moving.
@export_range(750.0, 3000.0) var thurst: float = 1000.0

@export var torque_thrust: float = 100.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Boost"):
		apply_central_force(basis.y * delta * thurst)

	if Input.is_action_pressed("Left Rotate"):
		apply_torque(Vector3(0.0, 0.0, torque_thrust * delta))

	if Input.is_action_pressed("Rotate Right"):
		apply_torque(Vector3(0.0, 0.0, -torque_thrust * delta))

func _on_body_entered(body: Node) -> void:
	if "Goal" in body.get_groups():
		print("You Win!")
		
	if "Hazard" in body.get_groups():
		crash_sequence()
		
func crash_sequence() -> void:
	print("KABOOM!")
	get_tree().reload_current_scene()
