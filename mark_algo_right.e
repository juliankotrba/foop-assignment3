note
	description: "Summary description for {MARK_ALGO_RIGHT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MARK_ALGO_RIGHT

inherit
	MARK

feature
	get_symbol : STRING
	do
		Result := "%/27/[1;35;47m4"
	end

	has_effect(player : PLAYER)
		local
			algo: ALGORITHM_TURN_RIGHT
		do
			create algo
			player.set_bot_algorithm(algo)
		end
end
