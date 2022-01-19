class_name JSONWriter
extends RefCounted

# static function for writing dictionaries to files as json markdown
# s_path: path of the file to write to
# dict_contents: dictionary to write to a file as json markdown
static func write_json(s_path,dict_contents):
	# file class instance for writing
	var file_file = File.new()
	
	# open file s_path for writing
	file_file.open(s_path, File.WRITE)
	
	# create a json markdow string from dict_contents for writing, format using tabs
	var json_obj = JSON.print(dict_contents,"\t")
	
	# write json_obj to file_file for future use
	file_file.store_string(json_obj)
	
	# close file_file to prevent memory issues
	file_file.close()
