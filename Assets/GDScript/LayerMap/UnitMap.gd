class_name UnitMap
extends LayerMap

# function called after initialization of itself and all parents and children
func _ready() -> void:
	Globals.new_unit_atlas.connect(on_new_unit_atlas)

func on_new_unit_atlas() -> void:
	var imtx : ImageTexture = ImageTexture.new()
	imtx.create_from_image(Globals.g_imge_unit_atlas)
	
	get_tileset().get_source(0).set_texture(imtx)
	get_tileset().get_source(0).set_texture_region_size(Vector2i(32,32))
	
	var i_x : int = Globals.g_imge_unit_atlas.get_width() / 32
	var i_y : int = Globals.g_imge_unit_atlas.get_height() / 32
	for x in i_x:
		for y in i_y:
			get_tileset().get_source(0).create_tile(Vector2i(x,y),Vector2i(1,1))
