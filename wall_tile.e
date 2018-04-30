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
	isWalkable : BOOLEAN
		do
			Result := false
		end

	getSymbol : STRING
		do
			Result := "x"
		end
end
