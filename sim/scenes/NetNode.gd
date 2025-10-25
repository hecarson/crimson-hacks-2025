extends Node3D
class_name NetNode

@export var node_id: String = "node"
@export var color: Color = Color(0.3, 0.8, 1.0)

var neighbors: Dictionary = {}   # neighbor_id -> NetLink
var is_online: bool = true

func _ready() -> void:
	var mat := StandardMaterial3D.new()
	mat.albedo_color = color
	mat.emission_enabled = true
	mat.emission = Color(0.05, 0.7, 0.1)   # default: online glow
	$MeshInstance3D.material_override = mat
	$Label3D.text = node_id

func set_online(state: bool) -> void:
	is_online = state
	var mat: StandardMaterial3D = $MeshInstance3D.material_override
	mat.emission = (Color(0.05, 0.7, 0.1) if state else Color(0.7, 0.1, 0.1))
