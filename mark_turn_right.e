note
	description: "Summary description for {MARK_TURN_RIGHT}."
	author: "Christina"
	date: "$Date$"
	revision: "$Revision$"

class
	MARK_TURN_RIGHT

inherit
	MARK

feature
	getSymbol : STRING
	do
		Result := "%/27/[0;30;47mR"
	end
end
