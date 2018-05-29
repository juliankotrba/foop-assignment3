note
	description: "Summary description for {MARK_ALGO_LEFT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MARK_ALGO_LEFT

inherit
	MARK
		redefine
			get_symbol
		end

feature
	get_symbol : STRING
	do
		Result := "%/27/[1;35;47m2"
	end

	has_effect(player : PLAYER)
		local
			algo: ALGORITHM_TURN_LEFT
		do
			create algo
			player.set_bot_algorithm (algo)
		end
end
