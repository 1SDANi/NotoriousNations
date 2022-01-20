extends TextureButton

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.new_unit_atlas.connect(on_new_unit_atlas)

func on_new_unit_atlas() -> void:
	var imtx : AtlasTexture = AtlasTexture.new()
	imtx.create_from_image(Globals.g_imge_unit_atlas)
	
	imtx.set_region(Rect2(Vector2(0,0),Vector2(32,32)))
	set_normal_texture(imtx)
