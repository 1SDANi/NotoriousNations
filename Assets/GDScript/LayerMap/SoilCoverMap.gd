class_name SoilCoverMap
extends LayerMap

const s_export_path = "res://Assets/JSON/Maps/Exported Map/map.json"

# temporary implementation, to later be replaced with a World Builder
# index to loop to
const i_min_cycle = 0
# index to loop after
const i_max_cycle = 11

var _map_map: Map
var map_map: Map:
	get: return _map_map

# function called after initialization of itself and all parents and children
func _ready():
	SoilCoverJSON.parse_folder()
	UnitTypeJSON.parse_folder()
	MapJSON.a_map_parse_folder()
	
	Globals.new_soilcover_atlas.connect(on_new_soilcover_atlas)
	Globals.new_unit_atlas.connect(on_new_unit_atlas)
	on_new_soilcover_atlas()
	on_new_unit_atlas()
	
	# temporary implemenetation, to later be replaced with a Map Selector
	# set map_map to Test Map 1 from globals
	_map_map = Globals._g_dict_maps["Test Map 1"]
	
	# load map_map
	load_map()

func on_new_soilcover_atlas() -> void:
	var imtx : ImageTexture = ImageTexture.new()
	imtx.create_from_image(Globals.g_imge_soil_cover_atlas)
	
	get_tileset().get_source(0).set_texture(imtx)
	get_tileset().get_source(0).set_texture_region_size(Vector2i(32,32))
	
	var i_x : int = Globals.g_imge_soil_cover_atlas.get_width() / 32
	var i_y : int = Globals.g_imge_soil_cover_atlas.get_height() / 32
	for x in i_x:
		for y in i_y:
			get_tileset().get_source(0).create_tile(Vector2i(x,y),Vector2i(1,1))

func on_new_unit_atlas() -> void:
	var imtx : ImageTexture = ImageTexture.new()
	imtx.create_from_image(Globals.g_imge_unit_atlas)
	
	get_tileset().get_source(1).set_texture(imtx)
	get_tileset().get_source(1).set_texture_region_size(Vector2i(32,32))
	
	var i_x : int = Globals.g_imge_soil_cover_atlas.get_width() / 32
	var i_y : int = Globals.g_imge_soil_cover_atlas.get_height() / 32
	for x in i_x:
		for y in i_y:
			get_tileset().get_source(1).create_tile(Vector2i(x,y),Vector2i(1,1))

# function called upon input event
func _input(event):
	# if the save button defined in Project->Project Settings->Input Map is pressed down
	if event.is_action_pressed("save"):
		# save map_map
		save_map()
	
# function called after _input if the input event that caused it to be called has yet to be flagged as handled
func _unhandled_input(event):
	# if the left mouse button is pressed
	if event is InputEventMouseButton and event.pressed and \
			event.get_button_index() == MOUSE_BUTTON_LEFT :
		# get the local position of the mouse position
		var v_event_pos = to_local(get_global_mouse_position())
		
		# convert the local position of the mouse position to the map coordinates
		var v_tile_pos = world_to_map(v_event_pos)
		
		# set cell at v_tile_pos to the next index in the cycle
		set_cell(0,v_tile_pos,0,v_cycle(get_cell_atlas_coords(0,v_tile_pos,false)),0)
	
# cycle cell index
# v_coords vector2i representing the current cell coordinates
func v_cycle(v_index):
	if v_index.x < get_tileset().get_source(0).get_atlas_grid_size().x:
		return Vector2i(v_index.x+1,v_index.y)
	else:
		if (v_index.y < get_tileset().get_source(0).get_atlas_grid_size().y):
			return Vector2i(0,v_index.y+1)
		else:
			return Vector2i(0,0)

# function to load map_map into this tilemap
func load_map():
	# for every column(?) in map_map
	for x in range(map_map.i_x):
		# for every row(?) in map_map
		for y in range(map_map.i_y):
			# set the cell at (x,y) to the index of this node's tileset with the same name as s_soil_cover_name
			var scvr_soil_cover : SoilCoverType = map_map.dict_tiles_from_int(x,y).scvr_soil_cover_type
			var i_atlas_x : int = scvr_soil_cover.i_x
			var i_atlas_y : int = scvr_soil_cover.i_y
			set_cell(0,Vector2i(x,y),0,Vector2i(i_atlas_x,i_atlas_y),0)

# save map
func save_map():
	# dictionary for storing the current map's contents in
	var dict_map = {}
	
	# string for temporary storage of coordinates
	var s_coordinates
	
	# temporary implementation, to be replaced with a prompt to enter a name later
	# set the s_name key/value pair of the map to be exported
	dict_map["s_name"] = "Exported Map"
	
	# set the s_type key/value pair of the map to be exported
	dict_map["s_type"] = "Map"
	
	# gets the rect within which all non-null tiles exist
	var rect_map = get_used_rect()
	
	# get the length of rect_map
	var i_x = rect_map.size.x
	
	# get the height of rect_map
	var i_y = rect_map.size.y
	
	# set the i_x key/value pair of the map to be exported
	dict_map["i_x"]=i_x
	
	# set the i_y key/value pair of the map to be exported to an empty dictionary
	dict_map["i_y"]=i_y
	
	# set the dict_tiles key/value pair of the map to be exported to an empty dictionary
	dict_map["dict_tiles"]={}
	
	# for each column(?) in rect_map
	for x in range(i_x):
	# for each row(?) in rect_map
		for y in range(i_y):
			# create a string containing the coordinate of the current tile
			s_coordinates = str(x) + "," + str(y)
			# set the s_coordinates key/value pair of the dict_tiles key/value pair to an empty dictionary
			dict_map["dict_tiles"][s_coordinates] = {}
			# temporary implementation, to be replaced with the ingame name of the tile
			# set the s_name key/value pair of the s_coordinates key/value pair to Barcelona
			dict_map["dict_tiles"][s_coordinates]["s_name"] = "Barcelona"
			# set the s_type of the s_coordinates key/value pair to Tile
			dict_map["dict_tiles"][s_coordinates]["s_type"] = "Tile"
			# set the s_soil_cover of the s_coordinates key/value pair to the name of the index of (x,y)'s tile in this node's tileset
			var v_atlas_coords: Vector2i = get_cell_atlas_coords(0,Vector2i(x,y),true)
			var s_soil_cover_name = ""
			for scvr_soil_cover in Globals.g_a_soil_cover_types:
				if scvr_soil_cover.x == v_atlas_coords.x and scvr_soil_cover.y == v_atlas_coords.y:
					s_soil_cover_name = scvr_soil_cover.name
					break
			dict_map["dict_tiles"][s_coordinates]["s_soil_cover"] = s_soil_cover_name
			
	# write dict_map to a json file at s_export_path
	JSONWriter.write_json(s_export_path,dict_map)

