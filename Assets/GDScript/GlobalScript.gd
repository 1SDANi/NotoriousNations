class_name GlobalScript
extends Node

signal new_soilcover_atlas
signal new_unit_atlas

# a String containing the name key constant
const s_name_key: String = "s_name"

# a String containing the missing name constant
const s_missing_name: String = "MISSING_NAME"

var _g_tlst_soil_cover_tileset_source : TileSetAtlasSource
@export var g_tlst_soil_cover_tileset_source: TileSetAtlasSource:
	get: return _g_tlst_soil_cover_tileset_source

var _g_tlst_unit_tileset_source : TileSetAtlasSource
@export var g_tlst_unit_tileset_source: TileSetAtlasSource:
	get: return _g_tlst_unit_tileset_source

var _g_dict_maps: Dictionary = {}
@export var g_dict_maps: Dictionary:
	get: return _g_dict_maps

# a dictionary containing soil cover types at their respective names
var _g_dict_soil_cover_types: Dictionary = {}
@export var g_dict_soil_cover_types: Dictionary:
	get: return _g_dict_soil_cover_types

# an image containing the soil cover atlas
var _g_imge_soil_cover_atlas: Image
@export var g_imge_soil_cover_atlas: Image:
	get: return _g_imge_soil_cover_atlas

# a dictionary containing unit types at their respective names
var _g_dict_unit_types: Dictionary = {}
@export var g_dict_unit_types: Dictionary:
	get: return _g_dict_unit_types

# an image containing the unit atlas
var _g_imge_unit_atlas: Image
@export var g_imge_unit_atlas: Image:
	get: return _g_imge_unit_atlas

# call to register a new unit atlas
# imge_unit_atlas: the image to be registered
# returns whether an error did not occur
func b_register_unit_atlas(imge_unit_atlas: Image) -> bool:
	# push a warning and return false if the soil cover type is null
	if not imge_unit_atlas:
		push_warning("something went wrong! somehow the unit atlas was not created")
		return false
	
	# register the unit atlas and return true
	_g_imge_unit_atlas=imge_unit_atlas
	
	var imtx : ImageTexture = ImageTexture.new()
	imtx.create_from_image(Globals._g_imge_unit_atlas)
	
	g_tlst_soil_cover_tileset_source = TileSetAtlasSource.new()
	
	new_unit_atlas.emit()
	return true

# call to register a new soil cover type
# untp_unit_type: the UnitType to be registered
# s_path: String containing the path of the UnitType, used for error checking
# returns whether an error did not occur
func b_register_unit_type(untp_unit_type: UnitType, s_path: String) -> bool:
	# push a warning and return false if the soil cover type is null
	if not untp_unit_type:
		push_warning("something went wrong! somehow the unit type at " + s_path + " was not created")
		return false
	
	# register the soil cover type and return true
	_g_dict_unit_types[untp_unit_type.s_name]=untp_unit_type
	return true

# call to register a new soil cover atlas
# imge_soil_cover_atlas: the image to be registered
# returns whether an error did not occur
func b_register_soil_cover_atlas(imge_soil_cover_atlas: Image) -> bool:
	# push a warning and return false if the soil cover type is null
	if not imge_soil_cover_atlas:
		push_warning("something went wrong! somehow the soil cover atlas was not created")
		return false
	
	# register the soil cover atlas and return true
	_g_imge_soil_cover_atlas=imge_soil_cover_atlas
	
	var imtx : ImageTexture = ImageTexture.new()
	imtx.create_from_image(Globals.g_imge_soil_cover_atlas)
	
	g_tlst_soil_cover_tileset_source = TileSetAtlasSource.new()
	
	new_soilcover_atlas.emit()
	return true

# call to register a new soil cover type
# scvr_soil_cover: the SoilCoverType to be registered
# s_path: String containing the path of the SoilCoverType, used for error checking
# returns whether an error did not occur
func b_register_soil_cover_type(scvr_soil_cover: SoilCoverType, s_path: String) -> bool:
	# push a warning and return false if the soil cover type is null
	if not scvr_soil_cover:
		push_warning("something went wrong! somehow the soil cover at " + s_path + " was not created")
		return false
	
	# register the soil cover type and return true
	_g_dict_soil_cover_types[scvr_soil_cover.s_name]=scvr_soil_cover
	return true

# call to register a new soil cover type
# map_map: the Map to be registered
# s_path: String containing the path of the Map, used for error checking
# returns whether an error did not occur
func b_register_map(map_map: Map, s_path: String) -> bool:
	# push a warning and return false if the soil cover type is null
	if not map_map:
		push_warning("something went wrong! somehow the soil cover at " + s_path + " was not created")
		return false
	
	# register the soil cover type and return true
	_g_dict_maps[map_map.s_name] = map_map
	return true
