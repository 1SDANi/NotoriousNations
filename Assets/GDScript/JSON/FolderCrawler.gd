class_name FolderCrawler
extends RefCounted

# static function for getting all files in a directory at s_path
# s_path: string containingi the path of the folder to get all filepaths from
static func a_s_crawl_folder(s_path):
	# array of strings containing filepaths for returning
	var a_s_paths = []
	# variable for temporary storage of filenames
	var s_filename
	
	# directory class instance for finding files
	var drct_directory = Directory.new()
	
	# open directory at s_path for finding files
	drct_directory.open(s_path)
	
	# begin listing all files in drct_directory for storing and returning filenames
	drct_directory.list_dir_begin()
	
	# iterate through all files in drct_directory
	while true:
		# get filename of next uniterated file
		s_filename = drct_directory.get_next()
		
		# break out of the while loop if there's no more files to iterate through
		if s_filename == "":
			break
		# if the file is not hidden
		elif not s_filename.begins_with("."):
			# add the path to the file to a_s_paths
			a_s_paths.append(s_path+s_filename)
			
	# close drct_directory to prevent memory issues
	drct_directory.list_dir_end()
	
	# return the array of path strings a_s_paths
	return a_s_paths
