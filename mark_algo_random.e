note
	description: "Summary description for {MARK_ALGO_RANDOM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MARK_ALGO_RANDOM

inherit
	MARK

feature
	get_symbol : STRING
	do
		Result := "%/27/[1;35;47m3"
	end

	has_effect(player : PLAYER)
		local
			algo: ALGORITHM_RANDOM
		do
			create algo
			player.set_bot_algorithm (algo)
		end
end
