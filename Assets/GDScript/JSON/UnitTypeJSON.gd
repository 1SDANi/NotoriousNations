class_name UnitTypeJSON
extends RefCounted

const s_unit_type_folder = "res://Assets/JSON/UnitTypes/"
const s_type_name = "UnitType"

# static function for parsing a directory for unit type files
static func parse_folder():
	var imge_atlas : Image
	var a_imge_images : Array[Image] = []
	var a_dict_jsons : Array[Dictionary] = []
	var a_s_paths : Array[String] = []
	var a_s_valid_paths : Array[String] = []
	var imge_temp_image : Image
	var i_err : int
	var s_image_path : String
	const i_resolution : int = 32
	
	# dictionary for temporary storage of json files
	var dict_json
	
	# unit type for temporary storage of newly created unit types
	var untp_unit_type
	
	# get all files in s_map_folder for iteration
	a_s_paths = FolderCrawler.a_s_crawl_folder(s_unit_type_folder)
	
	# iterate through all paths in a_s_paths
	for s_path in a_s_paths:
		if not s_path.to_lower().ends_with(".json"):
			continue
		
		# read the json markdown in the unit type .json at s_path as a dictionary for creating a new unit type from
		dict_json = JSONReader.dict_read_json(s_path)
		
		if dict_json == null:
			push_warning("file at " + s_path + " is not a json file")
			continue
		
		# skip this unit type if it's not a valid json file
		if not JSONReader.dict_validate_json(dict_json,s_path,s_type_name):
			push_warning("file at " + s_path + " is not a json file")
			continue
		
		# create a new image
		imge_temp_image = Image.new()
		
		# generate the path to the .png file
		s_image_path = s_path.trim_suffix(".json")
		s_image_path += ".png"
		
		# load .png file
		i_err = imge_temp_image.load(s_image_path)
		
		# skip this unit type if its corresponding .png file is not a valid .png file
		if i_err != OK:
			push_warning("error parsing png file at " + s_path)
			continue
		
		# skip this unit type if its resolution is not the right size
		if  imge_temp_image.get_width()  != i_resolution or \
			imge_temp_image.get_height() != i_resolution:
			push_warning("image at " + s_image_path + "is not 32x32")
			continue
		
		# append image to the arrays
		a_imge_images.append(imge_temp_image)
		a_dict_jsons.append(dict_json)
		a_s_valid_paths.append(s_path)
	
	var i_x : int
	var i_y : int
	var i_x_pos : int
	var i_y_pos : int
	
	if a_imge_images.size() != a_dict_jsons.size():
		push_warning("unit type image array and json array are not the same size")
		return
		
	var i_size = a_imge_images.size()
	
	var i_sqrt = sqrt(i_size)
	
	var i_ceil = int(ceil(i_sqrt))
	var i_floor = int(floor(i_sqrt))
	
	i_x = i_floor
	i_y = i_floor
	
	if i_ceil != i_floor:
		i_x += 1
		i_y += 1
		
	imge_atlas = Image.new()
	imge_atlas.create(i_resolution * i_x, i_resolution * i_y, false, a_imge_images[0].get_format())
	
	# iterate through all paths in a_s_paths
	var i_i : int = 0
	for dict_json in a_dict_jsons:
		
		i_x_pos = int(floor(i_i % i_x))
		i_y_pos = int(floor(i_i / i_x))
		
		# create a new unit type from dict_json's various key/value pairs
		untp_unit_type = UnitType.new (JSONReader.s_get_json_entry(dict_json,Globals.s_name_key,a_s_valid_paths[i_i],Globals.s_missing_name),
										s_type_name,
										JSONReader.s_get_json_entry(dict_json,"s_combat_role",a_s_valid_paths[i_i],"NoRole"),
										JSONReader.s_get_json_entry(dict_json,"s_combat_range",a_s_valid_paths[i_i],"NoRange"),
										JSONReader.s_get_json_entry(dict_json,"i_strength",a_s_valid_paths[i_i],0),
										JSONReader.s_get_json_entry(dict_json,"i_speed",a_s_valid_paths[i_i],0),
										JSONReader.s_get_json_entry(dict_json,"i_city_atk",a_s_valid_paths[i_i],0),
										JSONReader.s_get_json_entry(dict_json,"i_city_def",a_s_valid_paths[i_i],0),
										JSONReader.s_get_json_entry(dict_json,"i_hill_atk",a_s_valid_paths[i_i],0),
										JSONReader.s_get_json_entry(dict_json,"i_hill_def",a_s_valid_paths[i_i],0),
										JSONReader.s_get_json_entry(dict_json,"i_canopy_atk",a_s_valid_paths[i_i],0),
										JSONReader.s_get_json_entry(dict_json,"i_canopy_def",a_s_valid_paths[i_i],0),
										JSONReader.s_get_json_entry(dict_json,"i_open_atk",a_s_valid_paths[i_i],0),
										JSONReader.s_get_json_entry(dict_json,"i_open_def",a_s_valid_paths[i_i],0),
										JSONReader.s_get_json_entry(dict_json,"i_collateral",a_s_valid_paths[i_i],0),
										JSONReader.s_get_json_entry(dict_json,"b_no_tile_def",a_s_valid_paths[i_i],false),
										JSONReader.s_get_json_entry(dict_json,"b_skirmish",a_s_valid_paths[i_i],false),
										JSONReader.s_get_json_entry(dict_json,"b_flanking",a_s_valid_paths[i_i],false),
										JSONReader.s_get_json_entry(dict_json,"b_frontline",a_s_valid_paths[i_i],false),
										JSONReader.s_get_json_entry(dict_json,"b_infiltrate",a_s_valid_paths[i_i],false),
										JSONReader.s_get_json_entry(dict_json,"b_medic",a_s_valid_paths[i_i],false),
										JSONReader.s_get_json_entry(dict_json,"dict_i_role_atk",a_s_valid_paths[i_i],{}),
										JSONReader.s_get_json_entry(dict_json,"dict_i_role_def",a_s_valid_paths[i_i],{}),
										JSONReader.s_get_json_entry(dict_json,"dict_i_range_atk",a_s_valid_paths[i_i],{}),
										JSONReader.s_get_json_entry(dict_json,"dict_i_range_def",a_s_valid_paths[i_i],{}),
										JSONReader.s_get_json_entry(dict_json,"dict_i_type_atk",a_s_valid_paths[i_i],{}),
										JSONReader.s_get_json_entry(dict_json,"dict_i_type_def",a_s_valid_paths[i_i],{}),
										i_x_pos,
										i_y_pos)
		
		imge_atlas.blend_rect(a_imge_images[i_i],Rect2(0,0,i_resolution,i_resolution),Vector2(i_x_pos * i_resolution, i_y_pos * i_resolution))
		
		# register with glob_globals untp_unit_type as a new unit type from s_path
		Globals.b_register_unit_type(untp_unit_type,a_s_valid_paths[i_i])
		
		i_i += 1
		
	Globals.b_register_unit_atlas(imge_atlas)
