extends Node2D

@onready var rigid_body_2d: RigidBody2D = $RigidBody2D
@onready var camera_2d: Camera2D = $Camera2D


func _physics_process(_delta: float) -> void:
	camera_2d.position = rigid_body_2d.position
