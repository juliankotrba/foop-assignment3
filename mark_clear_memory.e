note
	description: "Summary description for {MARK_CLEAR_MEMORY}."
	author: "Christina"
	date: "$Date$"
	revision: "$Revision$"

class
	MARK_CLEAR_MEMORY

inherit
	MARK

feature
	get_symbol : STRING
	do
		Result := "%/27/[1;34;47mC"
	end

	has_effect(player : PLAYER)
		local
			memory1: BOTMEMORY
		do
			create memory1.make
			player.set_bot_memory (memory1)
		end
end
