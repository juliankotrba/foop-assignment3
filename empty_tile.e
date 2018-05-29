note
	description: "Summary description for {EMPTY_TILE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EMPTY_TILE
inherit
	TILE

feature
	is_walkable : BOOLEAN
		do
			Result := true
		end

	get_symbol : STRING
		do
			Result := "%/27/[0;30;47m "
		end

	has_effect(player : PLAYER)
		do
		end
end
