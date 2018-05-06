note
	description: "Summary description for {TILE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	TILE
feature
	is_walkable : BOOLEAN
		deferred
	end

	get_symbol : STRING
		deferred
	end
end
