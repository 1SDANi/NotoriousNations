class_name SoilCoverType
extends TileType

var _i_x: int = -1
@export var i_x: int:
	get: return _i_x

var _i_y: int = -1
@export var i_y: int:
	get: return _i_y

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
# x: int containing the x position of this SoilCoverType on the Soil Cover Type Atlas
# y: int containing the y position of this SoilCoverType on the Soil Cover Type Atlas
# returns void
# func _init(name: String, type: String, food: int, prod: int, comm: int, move: int, rainwater: bool, can_farm: bool, can_ranch: bool, can_camp: bool, x: int, y: int) -> void:
# 	# call the parent constructor
# 	super(name,type,food,prod,comm,move,rainwater,can_farm,can_ranch,can_camp)
# 	_i_x = x
# 	_i_y = y

func _init (dict: Dictionary) -> void:
	# call the parent constructor
	super(dict)

	# set the class variables
	for name in dict:
		self["_" + name] = dict[name]
