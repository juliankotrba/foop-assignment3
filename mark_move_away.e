note
	description: "Summary description for {MARK_MOVE_AWAY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MARK_MOVE_AWAY

inherit
	MARK

feature
	getSymbol : STRING
	do
		Result := "%/27/[1;34;47mM"
	end
end
