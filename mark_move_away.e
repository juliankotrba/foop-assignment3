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
	get_symbol : STRING
	do
		Result := "%/27/[1;34;47mM"
	end

	has_effect(player : PLAYER)
		do
			print("effect of MARK_MOVE_AWAY")
		end
end
