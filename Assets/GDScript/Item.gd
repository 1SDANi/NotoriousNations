class_name Item
extends RefCounted

# a string of the name of the item
var _s_name: String
@export var s_name: String:
	get: 
		return _s_name
		
# a string of the type of the item
var _s_type: String
@export var s_type: String:
	get: 
		return _s_type

# called upon initialization
# name: String containing the name of the item
# type: String containing the type of the item
# returns void
func _init(name: String, type: String) -> void:
	_s_name=name
	_s_type=type
