extends Node2D

@onready var rigid_body_2d: RigidBody2D = $RigidBody2D
@onready var camera_2d: Camera2D = $Camera2D
@onready var sphere: RigidBody2D = $Sphere


func _physics_process(_delta: float) -> void:
	camera_2d.position = sphere.position
