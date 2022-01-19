extends Sprite2D

func _ready():
	Globals.new_soilcover_atlas.connect(on_new_soilcover_atlas)
	on_new_soilcover_atlas()

func on_new_soilcover_atlas() -> void:
	var imtx : ImageTexture = ImageTexture.new()
	imtx.create_from_image(Globals.g_imge_soil_cover_atlas)
	set_texture(imtx)
