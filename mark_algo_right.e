note
	description: "Summary description for {MARK_ALGO_RIGHT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MARK_ALGO_RIGHT

inherit
	MARK

feature
	getSymbol : STRING
	do
		Result := "%/27/[1;35;47m4"
	end
end
