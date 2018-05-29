note
	description: "Summary description for {WALL_TILE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	WALL_TILE
inherit
	TILE

feature
	is_walkable : BOOLEAN
		do
			Result := false
		end

	get_symbol : STRING
		do
			Result := "%/27/[0;34;44m#"
		end

	has_effect(player : PLAYER)
		do
		end
end
