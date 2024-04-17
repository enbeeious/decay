extends Node

@export var cameraHint : Node
@export var cameraMode : String
@onready var primaryCamera = $PrimaryCamera

var cameraRotation = Vector3(0, 0, 0)
var sens = 0.23
var tickedUpdate = false
var goalPosA = Vector3(0, 0, 0)
var goalPosB = Vector3(0, 0, 0)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		cameraRotation.x += deg_to_rad(-event.relative.y) * sens
		cameraRotation.y += deg_to_rad(-event.relative.x) * sens

func _process(delta):
	primaryCamera.position = cameraHint.global_position
	primaryCamera.rotation = cameraRotation


func _physics_process(delta):
	tickedUpdate = true
