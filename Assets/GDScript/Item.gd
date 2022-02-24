class_name Item
extends RefCounted

# a string of the name of the item
var s_name: String
		
# a string of the type of the item
var s_type: String

# called upon initialization
# name: String containing the name of the item
# type: String containing the type of the item
# returns void
func _init(name: String, type: String) -> void:
	s_name=name
	s_type=type
