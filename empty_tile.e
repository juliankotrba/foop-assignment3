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
	isWalkable : BOOLEAN
		do
			Result := true
		end

	getSymbol : STRING
		do
			Result := "%/27/[0;30;47m "
		end
end
