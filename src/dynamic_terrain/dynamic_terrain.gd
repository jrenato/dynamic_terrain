@tool
extends StaticBody2D

#@onready var path_2d: Path2D = $Path2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D
@onready var polygon_2d: Polygon2D = $Polygon2D
@onready var line_2d: Line2D = $Line2D

var path_2d : Path2D = null
var path_count : int = 0


func _ready() -> void:
	check_paths_on_tree()
	if Engine.is_editor_hint():
		update_configuration_warnings()
	update_path_polygons()


func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		update_path_polygons()


func update_path_polygons() -> void:
	if path_2d and path_count == 1:
		toggle_visibility(true)

		var curve : Curve2D = path_2d.curve
		if curve:
			var polygon : PackedVector2Array = curve.get_baked_points()
			collision_polygon_2d.polygon = polygon
			polygon_2d.polygon = polygon
			line_2d.points = polygon

			polygon_2d.visible = true
			line_2d.visible = true
	else:
		toggle_visibility(false)


func toggle_visibility(value : bool) -> void:
	#collision_polygon_2d.visible = value
	polygon_2d.visible = value
	line_2d.visible = value


func _get_configuration_warnings() -> PackedStringArray:
	var warnings : PackedStringArray = PackedStringArray()

	if not path_2d:
		warnings.append("A Path2d is required to build the curved terrain")
		warnings.append("Add a Path2d as a child of this node")

	if path_count > 1:
		warnings.append("Only one Path2d is required")

	return warnings


func check_paths_on_tree() -> void:
	path_count = 0
	for child_node in get_children():
		if child_node is Path2D:
			path_count += 1
			path_2d = child_node

	if path_count != 1:
		path_2d = null

	if Engine.is_editor_hint():
		update_configuration_warnings()
		update_path_polygons()


func _on_child_entered_tree(_node: Node) -> void:
	if Engine.is_editor_hint():
		check_paths_on_tree()


func _on_child_exiting_tree(_node: Node) -> void:
	if Engine.is_editor_hint():
		check_paths_on_tree()
