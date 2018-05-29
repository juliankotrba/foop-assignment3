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
	get_symbol : STRING
	do
		Result := "%/27/[1;34;47mR"
	end

	has_effect(player : PLAYER)
		local
			special: SPECIALMARK_TURN_RIGHT
		do
			create special
			player.bot_memory.set_special(special)
		end
end
