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
	get_symbol : STRING
	do
		Result := "%/27/[0;30;47mS"
	end

	has_effect(player : PLAYER)
		do
			print("effect of MARK_STAY_IN_AREA")
		end
end
