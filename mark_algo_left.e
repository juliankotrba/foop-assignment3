note
	description: "Summary description for {MARK_ALGO_LEFT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MARK_ALGO_LEFT

inherit
	MARK

feature
	getSymbol : STRING
	do
		Result := "%/27/[1;35;47m2"
	end
end
