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
		Result := "%/27/[1;34;47mL"
	end

	has_effect(player : PLAYER)
		local
			special: SPECIALMARK_TURNLEFT
		do
			create special
			player.bot_memory.set_special(special)
		end
end
