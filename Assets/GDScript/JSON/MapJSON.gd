class_name MapJSON
extends RefCounted

const s_map_folder = "res://Assets/JSON/Maps/"
const s_type_name = "Map"

# static function for parsing a directory for map folders
# glob_globals: the current game's Globals.gd file
static func a_map_parse_folder() -> void:
	# string for temporary storage of map.json paths
	var s_path
	
	# dictionary for temporary storage of json files
	var dict_json
	
	# map for temporary storage of newly created maps
	var map_map
	
	# string for temporary storage of names of newly created maps
	var s_name
	
	# get all paths in s_map_folder for iteration
	var a_s_paths = FolderCrawler.a_s_crawl_folder(s_map_folder)
	
	# iterate through all paths in a_s_paths
	for s_folder_path in a_s_paths:
		# store the path to map.json in s_folder_path as a string for future reference
		s_path = s_folder_path+"/map.json"
		
		# read the json markdown in the map.json at s_path as a dictionary for creating a new map from
		dict_json = JSONReader.read_json(s_path)
		
		if dict_json == null:
			continue
		
		# skip this map if it's not a valid json file
		if not JSONReader.dict_validate_json(dict_json,s_path,s_type_name):
			continue
		
		# store the name of this map as a string for use as its paired key
		s_name = JSONReader.get_json_entry(dict_json,Globals.s_name_key,s_path,Globals.s_missing_name)
		
		# create a new map from dict_json's various key/value pairs
		map_map = Map.new  (s_name,
							s_type_name,
							JSONReader.get_json_entry(dict_json,"i_x",s_path,0),
							JSONReader.get_json_entry(dict_json,"i_y",s_path,0),
							JSONReader.get_json_entry(dict_json,"dict_tiles",s_path,{}))
		
		# return the dictionary of maps dict_map_maps
		Globals.b_register_map(map_map,s_path)
