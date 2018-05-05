note
	description: "Summary description for {MARK_TURN_LEFT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MARK_TURN_LEFT

inherit
	MARK

feature
	getSymbol : STRING
	do
		Result := "%/27/[0;30;47mL"
	end
end
