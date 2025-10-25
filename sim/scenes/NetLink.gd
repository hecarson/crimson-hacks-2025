extends Node3D
class_name NetLink

@export var latency_ms := 120.0
@export var bandwidth_mbps := 100.0
@export var loss_pct := 0.0

var a_node: NetNode
var b_node: NetNode

func connect_nodes(a: NetNode, b: NetNode) -> void:
	a_node = a
	b_node = b
	a.neighbors[b.node_id] = self
	b.neighbors[a.node_id] = self
	_rebuild()

func _rebuild() -> void:
	if not a_node or not b_node: return
	var p1 = a_node.global_transform.origin
	var p2 = b_node.global_transform.origin
	var mid = (p1 + p2) * 0.5
	var dir = p2 - p1
	global_transform = Transform3D(Basis().looking_at(dir.normalized(), Vector3.UP), mid)
	$MeshInstance3D.mesh.height = dir.length()
	$MeshInstance3D.rotation_degrees.x = 90
