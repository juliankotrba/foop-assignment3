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
	get_symbol : STRING
	do
		Result := "%/27/[0;30;47mL"
	end

	has_effect(player : PLAYER)
		do
			print("effect of MARK_TURN_LEFT")
		end
end
