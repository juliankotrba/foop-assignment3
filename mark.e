note
	description: "Summary description for {MARK}."
	author: "Christina"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	MARK

inherit
	TILE

feature
	isWalkable : BOOLEAN
	do
		Result := true
	end

	getSymbol : STRING
		deferred
	end
end
