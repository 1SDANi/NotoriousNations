class_name Tile
extends TileType

var _i_x: int = -1
@export var i_x: int:
	get: return _i_x

var _i_y: int = -1
@export var i_y: int:
	get: return _i_y

var a_unit_units: Array[Unit]

var _scvr_soil_cover_type: SoilCoverType = null:
	get: return _scvr_soil_cover_type
	set(value):
		_scvr_soil_cover_type = value
		recalculate()

# called upon initialization
# name: String containing the name of the item
# type: String containing the the type of the item
# x: int containing the horizontal position of this tile
# y: int containing the vertical position of this tile
# soil_cover_type: the SoilCoverType of this tile
# returns void
func _init(dict: Dictionary) -> void:
	# call the parent constructor
	super(dict)

	# set the class variables
	_i_x=dict.i_x
	_i_y=dict.i_y
	_scvr_soil_cover_type=dict.soil_cover_type

	# recalculate this tile's stats
	recalculate()


# adds a unit to the tile
# unit_unit: the unit  to add to the tile
# returns void
func add_unit(unit_unit: Unit) -> void:
	if not a_unit_units.has(unit_unit):
		a_unit_units.append(unit_unit)
		if Globals.map_map:
			Globals.unit_position_update.emit()

# remove a unit from the tile
# unit_unit: the unit to remove from the tile
# returns void
func remove_unit(unit_unit: Unit) -> void:
	if a_unit_units.has(unit_unit):
		a_unit_units.erase(unit_unit)
		if Globals.map_map:
			Globals.unit_position_update.emit()

func can_enter_from(unit : Unit, tile : Tile) -> bool:
	return true
	
func can_leave_to(unit : Unit, tile : Tile) -> bool:
	return true

# call to recalculate this tile's stats
# returns void
func recalculate() -> void:
	recalculate_food()
	recalculate_prod()
	recalculate_comm()
	recalculate_move()
	recalculate_rainwater()
	recalculate_can_farm()
	recalculate_can_ranch()
	recalculate_can_camp()

# call to recalculate this tile's food stat
# returns void
func recalculate_food() -> void:
	var i_temp_food = 0
	i_temp_food += _scvr_soil_cover_type.i_food
	_i_food=i_temp_food

func recalculate_prod() -> void:
	var i_temp_prod = 0
	i_temp_prod += _scvr_soil_cover_type.i_prod
	_i_prod=i_temp_prod

func recalculate_comm() -> void:
	var i_temp_comm = 0
	i_temp_comm += _scvr_soil_cover_type.i_comm
	_i_comm=i_temp_comm

func recalculate_move() -> void:
	var i_temp_move : int = 0
	if i_temp_move >= 0 and _scvr_soil_cover_type.i_move >= 0:
		i_temp_move += _scvr_soil_cover_type.i_move
	elif _scvr_soil_cover_type.i_move < i_temp_move:
		i_temp_move = _scvr_soil_cover_type.i_move
	_i_move=i_temp_move

func recalculate_rainwater() -> void:
	var b_temp_rainwater = true
	if not _scvr_soil_cover_type.b_rainwater:
		b_temp_rainwater = false

	_b_rainwater=b_temp_rainwater

func recalculate_can_farm() -> void:
	var b_temp_can_farm = true
	if not _scvr_soil_cover_type.b_can_farm:
		b_temp_can_farm = false

	_b_can_farm=b_temp_can_farm

func recalculate_can_ranch() -> void:
	var b_temp_can_ranch = true
	if not _scvr_soil_cover_type.b_can_ranch:
		b_temp_can_ranch = false

	_b_can_ranch=b_temp_can_ranch

func recalculate_can_camp() -> void:
	var b_temp_can_camp = true
	if not _scvr_soil_cover_type.b_can_camp:
		b_temp_can_camp = false

	_b_can_camp=b_temp_can_camp
