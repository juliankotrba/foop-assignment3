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
			Result := "%/27/[0;34;44m#"
		end
end
