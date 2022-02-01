class_name HMenu
extends HBoxContainer

var scne_menu_button = preload("res://Assets/Scenes/MenuButtonScalable.tscn")
var scne_menu_buffer = preload("res://Assets/Scenes/MenuBuffer.tscn")

var a_mnop_menu_options : Array = []
var i_menu_option_index : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.unit_position_update.connect(on_unit_position_update)
	Globals.tile_cursor_update.connect(on_tile_cursor_update)

func on_unit_position_update() -> void:
	populate_unit_menu()

func on_tile_cursor_update() -> void:
	populate_unit_menu()

func populate_unit_menu():
	
	i_menu_option_index = 0
	a_mnop_menu_options = []
	
	clear_children()
	
	new_back_option()
	
	for unit_unit in Globals.map_map.dict_tiles_from_int(Globals.vc2i_tile_cursor.x, Globals.vc2i_tile_cursor.y).a_unit_units:
		new_unit_option(unit_unit)
	
	if a_mnop_menu_options.size() > 0:
		a_mnop_menu_options[0].set_selected(true)

func new_back_option() -> void:
	var bttn_back_button = scne_menu_button.instantiate()
	bttn_back_button.set_option_type(self, "Back",0,0)
	add_option(bttn_back_button)

func new_unit_option(unit_unit: Unit) -> void:
	var bttn_unit_button = scne_menu_button.instantiate()
	bttn_unit_button.set_option_type(self, "Unit",unit_unit.untp_unit_type.i_x,unit_unit.untp_unit_type.i_y)
	add_option(bttn_unit_button)

func add_option(bttn_button : TextureButton):
	add_child(bttn_button)
	add_child(scne_menu_buffer.instantiate())
	a_mnop_menu_options.append((bttn_button))

func clear_children() -> void:
	for n in get_children():
		remove_child(n)
		n.queue_free()

func move_selected_unit(v_tile_pos : Vector2):
	if not Globals.map_map._dict_tiles.has(str(v_tile_pos.x) + "," + str(v_tile_pos.y)):
		return
	if i_menu_option_index == 0:
		return
	
	var tile_tile = Globals.map_map._dict_tiles.get(str(v_tile_pos.x) + "," + str(v_tile_pos.y))
	var selected_tile =  Globals.map_map.dict_tiles_from_int(Globals.vc2i_tile_cursor.x, Globals.vc2i_tile_cursor.y)
	if selected_tile.a_unit_units[i_menu_option_index-1].move_to_tile(tile_tile):
		Globals.vc2i_tile_cursor = v_tile_pos
		Globals.tile_cursor_update.emit()
	

func option_pressed(mnop_menu_option : MenuOption):
	if (not a_mnop_menu_options.has(mnop_menu_option)) or \
		(not get_children().has(mnop_menu_option)):
		return
	a_mnop_menu_options[i_menu_option_index].set_selected(false)
	mnop_menu_option.set_selected(true)
	i_menu_option_index = a_mnop_menu_options.find(mnop_menu_option)
