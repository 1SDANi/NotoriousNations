class_name Unit
extends Item

var untp_unit_type: UnitType = null

var s_owner: String = ""

func _init (name: String, type: String, owner: String, unit_type: UnitType) -> void:
	super(name, type)
	
	s_owner = owner
	untp_unit_type = unit_type
