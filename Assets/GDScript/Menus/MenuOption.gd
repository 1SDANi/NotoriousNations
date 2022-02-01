class_name MenuOption
extends TextureButton

var optp_option_type : String
const i_resolution : int = 32

var i_texture_x : int
var i_texture_y : int

var hmnu_hmenu

func _ready() -> void:
	get_viewport().size_changed.connect(on_resize)
	
	on_resize()

func on_resize():
	set_custom_minimum_size(Vector2(get_size().y,0))

func set_option_type(hmenu,option_type : String, x : int, y : int):
	optp_option_type = option_type
	i_texture_x = x
	i_texture_y = y
	hmnu_hmenu = hmenu
	make_connections()
	create_image()

func create_image() -> void:
	var imtx : ImageTexture
	var normal_texture : AtlasTexture
	
	imtx = ImageTexture.new()
	normal_texture = get_normal_texture()
	set_normal_texture(normal_texture.duplicate())
	normal_texture = get_normal_texture()
	
	if optp_option_type == "Unit":
		imtx.create_from_image(Globals.g_imge_unit_atlas)
		normal_texture.set_atlas(imtx)

	if optp_option_type == "Back":
		normal_texture.set_atlas(Globals.imge_back_button)
		
	
	normal_texture.set_region(Rect2(	Vector2(i_texture_x*i_resolution, i_texture_y*i_resolution),
									Vector2(i_resolution,i_resolution)))
	set_normal_texture(normal_texture)
	on_resize()

func make_connections():
	if optp_option_type == "Unit":
		Globals.new_unit_atlas.connect(on_new_unit_atlas)

func on_new_unit_atlas() -> void:
	var imtx : ImageTexture
	var normal_texture : AtlasTexture
	
	imtx = ImageTexture.new()
	normal_texture = get_normal_texture()
	set_normal_texture(normal_texture.duplicate())
	normal_texture = get_normal_texture()
	
	imtx.create_from_image(Globals.g_imge_unit_atlas)
	normal_texture.set_atlas(imtx)
	
	normal_texture.set_region(Rect2(	Vector2(i_texture_x*i_resolution, i_texture_y*i_resolution),
									Vector2(i_resolution,i_resolution)))
	set_normal_texture(normal_texture)

func set_selected(selected : bool) -> void:
	get_child(0).set_visible(selected)

func _pressed():
	hmnu_hmenu.option_pressed(self)
