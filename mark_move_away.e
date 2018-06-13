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
		local
			special: SPECIALMARK_MOVEAWAY
		do
			create special.constructor(player.position_width,player.position_height)
			player.bot_memory.set_special(special)
		end
end
