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
	getSymbol : STRING
	do
		Result := "%/27/[0;30;47m1"
	end

	has_effect(player: PLAYER)
		do
			print("effect of MARK_ALGO_DFS")
		end
end
