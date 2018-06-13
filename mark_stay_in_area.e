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
		Result := "%/27/[1;34;47mS"
	end

	has_effect(player : PLAYER)
		local
			special: SPECIALMARK_STAYINAREA
		do
			create special.constructor(player.position_width,player.position_height)
			player.bot_memory.set_special(special)
		end
end
