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
		Result := "%/27/[0;30;47mM"
	end
end