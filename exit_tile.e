note
	description: "Summary description for {EXIT_TILE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EXIT_TILE
inherit
	TILE

feature
	isWalkable : BOOLEAN
		do
			Result := false
		end

	getSymbol : STRING
		do
			Result := "e"
		end
end
