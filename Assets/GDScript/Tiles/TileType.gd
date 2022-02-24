class_name TileType
extends Item

# int containing the amount of food obtained from working this tile
var _i_food: int = 0
@export var i_food: int:
	get: return _i_food

# int containing the amount of production obtained from working this tile
var _i_prod: int = 0
@export var i_prod: int:
	get: return _i_prod

# int containing the amount of commerce obtained from working this tile
var _i_comm: int = 0
@export var i_comm: int:
	get: return _i_comm

# int containing the cost of moving onto this tile
var _i_move: int = 1
@export var i_move: int:
	get: return _i_move

# bool containing whether this tile is self-irrigating
var _b_rainwater: bool = false
@export var b_rainwater : bool:
	get: return _b_rainwater

# bool containing whether this tile can be farmed
var _b_can_farm: bool = false
@export var b_can_farm : bool:
	get: return _b_can_farm

# bool containing whether this tile can be ranched
var _b_can_ranch: bool = false
@export var b_can_ranch : bool:
	get: return _b_can_ranch

# bool containing whether this tile can be camped
var _b_can_camp: bool = false
@export var b_can_camp : bool:
	get: return _b_can_camp

# called upon initialization
# name: String containing the name of the item
# type: String containing the type of the item
# food: int containing the amount of food obtained from working this tile
# prod: int containing the amount of production obtained from working this tile
# comm: int containing the amount of commerce obtained from working this tile
# move: int containing the cost of moving onto this tile
# rainwater: bool containing whether this tile is self-irrigating
# can_farm: bool containing whether this tile can be farmed
# can_ranch: bool containing whether this tile can be ranched
# can camp: bool containing whether this tile can be camped
# returns void
# func _init (name: String, type: String, food: int, prod: int, comm: int, move: int,
# 			rainwater: bool, can_farm: bool, can_ranch: bool, can_camp: bool) -> void:
# 	# call the parent constructor
# 	super(name,type)
#
# 	# set the class variables
# 	_i_food=food
# 	_i_prod=prod
# 	_i_comm=comm
# 	_i_move=move
# 	_b_rainwater=rainwater
# 	_b_can_farm=can_farm
# 	_b_can_ranch=can_ranch
# 	_b_can_camp=can_camp

func _init (dict: Dictionary) -> void:
	# call the parent constructor
	super(dict.get("s_name"), dict.get("s_type"))

	# set the class variables
	for name in dict:
		self.set("_" + name, dict.get(name))
