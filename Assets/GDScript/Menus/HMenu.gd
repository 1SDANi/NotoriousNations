extends HBoxContainer

var scne_MenuButton = preload("res://Assets/Scenes/MenuButton.tscn")
var scne_MenuBuffer = preload("res://Assets/Scenes/MenuBuffer.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.unit_position_update.connect(on_unit_position_update)
	Globals.tile_cursor_update.connect(on_tile_cursor_update)

func on_unit_position_update() -> void:
	populate_unit_menu()

func on_tile_cursor_update() -> void:
	populate_unit_menu()

func populate_unit_menu():
	var bttn_unit_button
	var imtx : ImageTexture
	var normal_texture : AtlasTexture
	
	clear_children()
	for unit_unit in Globals.map_map.dict_tiles_from_int(Globals.vc2i_tile_cursor.x, Globals.vc2i_tile_cursor.y).a_unit_units:
		bttn_unit_button = scne_MenuButton.instantiate()
		normal_texture = bttn_unit_button.get_normal_texture()
		
		imtx = ImageTexture.new()
		imtx.create_from_image(Globals.g_imge_unit_atlas)
		
		normal_texture.set_atlas(imtx)
		normal_texture.set_region(Rect2(	Vector2(	unit_unit.untp_unit_type.i_x,
												unit_unit.untp_unit_type.i_y),
										Vector2(32,32)))
		bttn_unit_button.set_normal_texture(normal_texture)
		
		add_child(bttn_unit_button)
		add_child(scne_MenuBuffer.instantiate())
		

func clear_children() -> void:
	for n in get_children():
		remove_child(n)
		n.queue_free()
