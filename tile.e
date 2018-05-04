note
	description: "Summary description for {TILE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	TILE
feature
	isWalkable : BOOLEAN
		deferred
	end

	getSymbol : STRING
		deferred
	end
end
