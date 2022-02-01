class_name Unit
extends Item

var untp_unit_type: UnitType = null

var tile_tile : Tile

var s_owner: String = ""

func _init (name: String, type: String, owner: String, unit_type: UnitType, tile: Tile) -> void:
	super(name, type)
	
	s_owner = owner
	untp_unit_type = unit_type
	new_tile(tile)

func new_tile(tile : Tile):
	if not tile:
		return
	if tile_tile and tile_tile.a_unit_units.has(self):
		tile_tile.remove_unit(self)
	if not tile.a_unit_units.has(self):
		tile.add_unit(self)
	tile_tile = tile

func move_to_tile(tile : Tile) -> bool:
	if tile.can_enter_from(self,tile_tile) and tile_tile.can_leave_to(self,tile):
		tile_tile.remove_unit(self)
		tile.add_unit(self)
		var old_tile = tile_tile
		new_tile(tile)
		Globals.unit_position_update.emit(tile_tile,old_tile)
		return true
	return false
