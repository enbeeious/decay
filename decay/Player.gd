extends RigidBody3D

@export var primaryCamera : Camera3D
@export var speed : float
@export var airResistance : float
@export var jumpPower : float
@onready var stander = $Stander



func _integrate_forces(state):
	var axisX = Input.get_axis("A", "D")
	var axisY = Input.get_axis("S", "W")
	
	var axisAdjusted = Vector2(axisX, axisY).rotated(primaryCamera.rotation.y)
	var velVec = Vector3(axisAdjusted.x, 0, -axisAdjusted.y).normalized()
	
	
	
	var onGround = stander.has_overlapping_bodies()
	
	if onGround:
		apply_central_force(velVec * speed - linear_velocity)
		linear_velocity.x *= 0.8
		linear_velocity.z *= 0.8
		if Input.is_action_just_pressed("SPACE"):
			apply_central_impulse(Vector3(0, jumpPower, 0))
	else:
		apply_central_force(velVec * speed * airResistance - linear_velocity)
		linear_velocity.x *= 0.95
		linear_velocity.z *= 0.95
