extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.tile_cursor_update.connect(on_tile_cursor_update)

func on_tile_cursor_update() -> void:
	set_position(Vector2i(Globals.vc2i_tile_cursor.x * 32 + 16, Globals.vc2i_tile_cursor.y * 32 + 16))
