note
	description: "Summary description for {MARK_ALGO_RANDOM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MARK_ALGO_RANDOM

inherit
	MARK

feature
	getSymbol : STRING
	do
		Result := "%/27/[0;30;47m3"
	end
end
