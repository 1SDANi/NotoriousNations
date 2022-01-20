class_name JSONReader
extends RefCounted

# static function for converting a json file into a Dictionary
# s_path: string containing the path of the json file to read
static func dict_read_json(s_path: String) -> void:
	# file class instance for reading
	var file_file = File.new()
	
	# open file at s_path for reading
	file_file.open(s_path, File.READ)
	
	# read contents of file_file at s_path as a string for parsing
	var text = file_file.get_as_text()
	
	# parse json contents of text as a JSONParseResult for returning
	var json_parser: JSON = JSON.new()
	var error = json_parser.parse(text)
	
	# close file_file to prevent memory issues
	file_file.close()
	
	# if there was an error
	if error != OK:
		# return null
		return null
	
	# otherwise return the dictionary stored in JSONParseResult
	return json_parser.get_data()
	
# static function for checking if a dict_json is valid
# dict_json: dictionary containing the parsed json file to validate
# s_path: string containing the path where dict_json was found, only used for error checking feedback
# s_expected_types: array of strings of acceptable values of the s_type key of dict_json
# returns whether an error did not occur
static func dict_validate_json(dict_json: Dictionary, s_path: String, s_expected_types) -> bool:
	# return false if dict_json is empty
	if dict_json == {}:
		return false
		
	#  if dict_json does not contain a s_type key
	if not dict_json.has("s_type"):
		# push a warning
		push_warning("asset at " + s_path + "is lacks a s_type entry")
		# return false
		return false
		
	#  if dict_json's s_type key's value is not in s_expected_types
	if not ((typeof(s_expected_types)==TYPE_ARRAY and dict_json["s_type"] in s_expected_types)\
			or (typeof(s_expected_types)==TYPE_STRING and dict_json["s_type"]==s_expected_types)):
		# push a warning
		push_warning("s_type of asset at " + s_path + " is not Soil Cover")
		# return false
		return false
		
	return true
	
# static function for getting the value of the s_entry key of dict_json
# dict_json: dictionary containing the parsed json file containing the s_entry key whose value should be returned
# s_entry: String of the key whose paired value should be returned
# s_path: String containing the path where dict_json was found, only used for error checking feedback
# v_default: default value of any variable that can be a value, returned if a value cannot be returned
static func s_get_json_entry(dict_json: Dictionary, s_entry: String, s_path: String, v_default) -> String:
	# if dict_json does not contain the key "s_entry"
	if not dict_json.has(s_entry):
		# return v_default
		return v_default
		
	# return the value of the s_entry key of dict_json
	return dict_json[s_entry]
