note
	description: "Summary description for {MARK_STAY_IN_AREA}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MARK_STAY_IN_AREA

inherit
	MARK

feature
	getSymbol : STRING
	do
		Result := "%/27/[0;30;47mS"
	end
end
