extends RigidBody3D

@export var primaryCamera : Camera3D
@onready var stander = $Stander

func _integrate_forces(state):
	var axisX = Input.get_axis("A", "D")
	var axisY = Input.get_axis("S", "W")
	
	var axisAdjusted = Vector2(axisX, axisY).rotated(primaryCamera.rotation.y)
	linear_velocity.x = axisAdjusted.x * 3
	linear_velocity.z = -axisAdjusted.y * 3
	
	if stander.has_overlapping_bodies() and Input.is_action_just_pressed("SPACE"):
		linear_velocity.y = 6
