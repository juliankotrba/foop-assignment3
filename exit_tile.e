note
	description: "Summary description for {EXIT_TILE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EXIT_TILE
inherit
	TILE

feature
	is_walkable : BOOLEAN
		do
			Result := true
		end

	get_symbol : STRING
		do
			Result := "%/27/[1;37;46mE"
		end

	has_effect(player : PLAYER)
		do
			print("Player " + (player.bot_id + 1).out + " has won")
			exit
		end

feature {NONE}

	exit
		external "C inline use <stdlib.h>"
			alias "exit(0)"
		end
end
