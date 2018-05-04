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
			Result := "%/27/[1;36;47mE"
		end
end
