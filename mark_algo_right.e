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
		Result := "%/27/[0;30;47m4"
	end

	has_effect(player : PLAYER)
		do
			print("effect of MARK_ALGO_RIGHT")
		end
end
