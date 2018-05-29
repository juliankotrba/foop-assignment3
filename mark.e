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
	is_walkable : BOOLEAN
		do
			Result := true
		end

end
