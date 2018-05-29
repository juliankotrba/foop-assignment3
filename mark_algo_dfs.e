note
	description: "Summary description for {MARK_ALGO_DFS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MARK_ALGO_DFS

inherit
	MARK

feature
	get_symbol : STRING
	do
		Result := "%/27/[1;35;47m1"
	end

	has_effect(player : PLAYER)
		local
			algo: ALGORITHM_DFS
		do
			create algo
			player.set_bot_algorithm (algo)
		end
end
