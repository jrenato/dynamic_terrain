extends StaticBody2D

@onready var path_2d: Path2D = $Path2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D
@onready var polygon_2d: Polygon2D = $Polygon2D
@onready var line_2d: Line2D = $Line2D


func _ready() -> void:
	var curve : Curve2D = path_2d.curve
	var polygon : PackedVector2Array = curve.get_baked_points()

	collision_polygon_2d.polygon = polygon
	polygon_2d.polygon = polygon
	line_2d.points = polygon
