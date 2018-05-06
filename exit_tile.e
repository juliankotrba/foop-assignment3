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
	is_walkable : BOOLEAN
		do
			Result := false
		end

	get_symbol : STRING
		do
			Result := "%/27/[1;37;46mE"
		end
end
