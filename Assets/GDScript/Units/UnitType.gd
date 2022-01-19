class_name UnitType
extends Item

# String containing the combat role of the unit
var _s_combat_role: String = "NoRole"
@export var s_combat_role: String:
	get: return _s_combat_role

# String containing the combat range of the unit
var _s_combat_range: String = "NoRange"
@export var s_combat_range: String:
	get: return _s_combat_range

# int containing the health of and damage dealt by the unit
var _i_strength: int = 0
@export var i_strength: int:
	get: return _i_strength
	
# int containing the number of movement points the unit regains each turn
var _i_speed: int = 0
@export var i_speed: int:
	get: return _i_speed
	
# int containing bonus damage when attacking a city
var _i_city_atk: int = 0
@export var i_city_atk: int:
	get: return _i_city_atk
	
# int containing bonus damage when defending a city
var _i_city_def: int = 0
@export var i_city_def: int:
	get: return _i_city_def
	
# int containing bonus damage when attacking a hill
var _i_hill_atk: int = 1
@export var i_hill_atk: int:
	get: return _i_hill_atk
	
# int containing bonus damage when defending a hill
var _i_hill_def: int = 1
@export var i_hill_def: int:
	get: return _i_hill_def
	
# int containing bonus damage when attacking under a canopy
var _i_canopy_atk: int = 1
@export var i_canopy_atk: int:
	get: return _i_canopy_atk
	
# int containing bonus damage when defending under a canopy
var _i_canopy_def: int = 1
@export var i_canopy_def: int:
	get: return _i_canopy_def
	
# int containing bonus damage when attacking open terrain
var _i_open_atk: int = 1
@export var i_open_atk: int:
	get: return _i_open_atk
	
# int containing bonus damage when defending open terrain
var _i_open_def: int = 1
@export var i_open_def: int:
	get: return _i_open_def
	
# int containing base damage dealt while attacking to all units in a stack that are not defending
var _i_collateral: int = 1
@export var i_collateral: int:
	get: return _i_collateral

# bool containing whether this unit can gain bonus damage while defending
var _b_no_tile_def: bool = false
@export var b_no_tile_def : bool:
	get: return _b_no_tile_def

# bool containing whether this unit takes half damage while attacking
var _b_skirmish: bool = false
@export var b_skirmish : bool:
	get: return _b_skirmish

# bool containing whether stacks defending against this unit's attacks use the flanked defense response
# the flanked defense response is:
	# the defender is a unit with flanking, if any
	# if not, the defender is a unit with frontline, if any
	# if not, the defender is the weakest unit in the stack
var _b_flanking: bool = false
@export var b_flanking : bool:
	get: return _b_flanking

# bool containing whether this unit defends before the weakest unit in the stack in a flanked defense
var _b_frontline: bool = false
@export var b_frontline : bool:
	get: return _b_frontline

# bool containing whether units in this fully fortified unit's stack ignore city defenses
var _b_infiltrate: bool = false
@export var b_infiltrate : bool:
	get: return _b_infiltrate

# bool containing whether this unit heals other units in this unit's stack by 1 Strength per turn
var _b_medic: bool = false
@export var b_medic : bool:
	get: return _b_medic

# bool containing a dictionary of bonus damage granted while attacking defenders of given roles
var _dict_i_role_atk = {}
@export var dict_i_role_atk : Dictionary:
	get: return _dict_i_role_atk

# bool containing a dictionary of bonus damage granted while defending against attackers of given roles
var _dict_i_role_def = {}
@export var dict_i_role_def : Dictionary:
	get: return _dict_i_role_def

# bool containing a dictionary of bonus damage granted while attacking defenders of given ranges
var _dict_i_range_atk = {}
@export var dict_i_range_atk : Dictionary:
	get: return _dict_i_range_atk

# bool containing a dictionary of bonus damage granted while defending against attackers of given ranges
var _dict_i_range_def = {}
@export var dict_i_range_def : Dictionary:
	get: return _dict_i_range_def

# bool containing a dictionary of bonus damage granted while attacking defenders of given unit types
var _dict_i_type_atk = {}
@export var dict_i_type_atk : Dictionary:
	get: return _dict_i_type_atk

# bool containing a dictionary of bonus damage granted while defending against attackers of given types
var _dict_i_type_def = {}
@export var dict_i_type_def : Dictionary:
	get: return _dict_i_type_def

var _i_x: int = -1
@export var i_x: int:
	get: return _i_x

var _i_y: int = -1
@export var i_y: int:
	get: return _i_y


# called upon initialization
# name: String containing the name of the item
# type: String containing the type of the item
# combat_role: String containing the combat role of the unit
# combat_range: String containing the combat range of the unit
# strength: int containing the health of and damage dealt by the unit
# speed: int containing the number of movement points the unit regains each turn
# returns void
func _init (name: String, type: String, combat_role: String, combat_range: String, strength: int, speed: int,
			city_atk: int, city_def: int, hill_atk: int, hill_def: int, canopy_atk: int, canopy_def: int,
			open_atk: int, open_def: int, collateral: int, no_tile_def: bool, skirmish: bool, flanking: bool,
			frontline: bool, infiltrate: bool, medic: bool, role_atk: Dictionary, role_def: Dictionary,
			range_atk: Dictionary, range_def: Dictionary, type_atk: Dictionary, type_def: Dictionary,
			x: int, y: int) -> void:
	# call the parent constructor
	super(name,type)
	
	# set the class variables
	_s_combat_role=combat_role
	_s_combat_range=combat_range
	_i_strength=strength
	_i_speed=speed
	_i_city_atk=city_atk
	_i_city_def=city_def
	_i_hill_atk=hill_atk
	_i_hill_def=hill_def
	_i_canopy_atk=canopy_atk
	_i_canopy_def=canopy_def
	_i_open_atk=open_atk
	_i_open_def=open_def
	_i_collateral=collateral
	_b_no_tile_def=no_tile_def
	_b_skirmish=skirmish
	_b_flanking=flanking
	_b_frontline=frontline
	_b_infiltrate=infiltrate
	_b_medic=medic
	_dict_i_role_atk=role_atk
	_dict_i_role_def=role_def
	_dict_i_range_atk=range_atk
	_dict_i_range_def=range_def
	_dict_i_type_atk=type_atk
	_dict_i_type_def=type_def
	_i_x = x
	_i_y = y
