extends Node3D

var earth_angle = 0
var earth_revol_rate = 0.5
var mars_angle = 0
var mars_revol_rate = 0.3
var earth_rad = 6
var mars_rad = 8

var earth;
var mars;
var earth_relays = [];
var mars_relays = [];

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	earth = find_child("earth", true)
	mars = find_child("mars", true)
	for i in 3:
		var earth_relay_name = "relay" + str(i + 1)
		var mars_relay_name = "relay" + str(i + 4)
		var earth_relay = find_child(earth_relay_name)
		var mars_relay = find_child(mars_relay_name)
		earth_relays.append(earth_relay)
		mars_relays.append(mars_relay)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	earth.position.x = cos(earth_angle) * earth_rad
	earth.position.z = sin(earth_angle) * earth_rad
	mars.position.x = cos(mars_angle) * mars_rad
	mars.position.z = sin(mars_angle) * mars_rad
	
	for i in 3:
		var earth_relay = earth_relays[i]
		var mars_relay = mars_relays[i]
		print(earth_relay)
		print(mars_relay)
		var earth_relay_angle = earth_angle + (PI / 6) + (PI / 3) * i * 2
		var mars_relay_angle = mars_angle + (PI / 6) + (PI / 3) * i * 2
		earth_relay.position.x = cos(earth_relay_angle) * earth_rad
		earth_relay.position.z = sin(earth_relay_angle) * earth_rad
		mars_relay.position.x = cos(mars_relay_angle) * mars_rad
		mars_relay.position.z = sin(mars_relay_angle) * mars_rad
	
	earth_angle += earth_revol_rate * delta
	mars_angle += mars_revol_rate * delta
	if earth_angle > PI * 2:
		earth_angle -= PI * 2
	if mars_angle > PI * 2:
		mars_angle -= PI * 2
