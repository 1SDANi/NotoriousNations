class_name Unit
extends Item

var _untp_unit_type: UnitType = null
var untp_unit_type : UnitType:
	get: return _untp_unit_type

func _init (name: String, type: String, unit_type: UnitType) -> void:
	super(name, type)
	
	_untp_unit_type = unit_type
